class CreateProgramsAndParticipantsFromSheet
  def self.call
    Rails.logger.info "AUTOBOT: initializing sheet"
    obj = self.new

    Rails.logger.info "AUTOBOT: initialized, starting creation"
    obj.create_programs_and_participants

    # obj.delete_done_rows
    true
  end

  ## -----------------------------------------------------
  ## Instance Methods
  ## -----------------------------------------------------

  def create_programs_and_participants
    @list
    .each_with_index do |row, i|
      with_rescue_and_save_wrapper do
        @current_row = row
        Rails.logger.info "\n AUTOBOT: processing row: #{i + 2}"

        ## Next row if row already processed or row empty
        if !row['AutoBot'].empty?
          Rails.logger.info "\n AUTOBOT: row already processed, skipping"
          next
        end
        if row.to_h.values.uniq == [""]
          Rails.logger.info "\n AUTOBOT: row empty, skipping"
          next
        end

        ## Extract program keys from row
        program_hash = {
          type: row['ProgramType'],
          online_registration_count: row['Number of participants'].to_i,
          starts_at: Date.strptime(row['StartDate'], "%d %b %Y"),
          ends_at: Date.strptime(row['EndDate'], "%d %b %Y"),
          center_id: Center.find_by(name: row['Center']).id,
          user_id: 1
        }

        ## IF start_date stale Mark row STALE and skip
        if program_hash[:starts_at] < 7.days.ago
          row['AutoBot'] = 'STALE'
          Rails.logger.info "AUTOBOT: row marked STALE. ProgramDate: #{program_hash[:starts_at]}"
          next
        end

        ## Find if program exists, else create new. Return id
          digest = Program.get_digest program_hash
        program = Program.find_by(digest: digest)
        if program.nil?
          program = Program.create!(program_hash)
          Rails.logger.info "AUTOBOT: created new program"
        else
          new_online_registration_count = program_hash[:online_registration_count] + program.online_registration_count
          program.update online_registration_count: new_online_registration_count
          Rails.logger.info "AUTOBOT: program exists, re-using"
        end

        ## Create temp_participant using program_id and participant data from row
        t_p = {
          program_id: program.id,

          phone: row['Cell Phone'].gsub(/\s+/, "").gsub(/\+91/, ""),
          email: row['Email'],
          name: row['Name'],
          pincode: row['PostalCode'],
          gender: row['Gender'],
          city: row['City']
        }
        TempParticipant.create! t_p
        Rails.logger.info "AUTOBOT: temp_participant created: #{t_p.slice(:name, :email, :phone)}"

        ## Mark row as processed
        row['AutoBot'] = 'DONE'
        Rails.logger.info "AUTOBOT: row marked DONE"
      end
    end
  end

  # def delete_done_rows
  #   Rails.logger.info "AUTOBOT: starting processed row deletion"
  #   @list
  #     .select { |row| row['AutoBot'] == 'DONE' }
  #     .each_with_index do |row, i|
  #       @ws.delete_rows(i + 2, 1)
  #     end
  #   @ws.save
  #   Rails.logger.info "AUTOBOT: processed rows deleted"
  # end

  def initialize
    @@program_colums = ['ProgramType', 'StartDate', 'EndDate', 'Center']
    @@participant_columns = ['Cell Phone', 'Email', 'Name', 'PostalCode', 'Gender', 'City']

    @ws = GSheet.get
    @list = @ws.list
    @columns = @@program_colums + @@participant_columns + ['AutoBot']
    validate_sheet
  end

  private

  def with_rescue_and_save_wrapper
    begin
      yield

    rescue ActiveRecord::ActiveRecordError => ex
      ## Log Error
      Rails.logger.error ex
      Rails.logger.error(@current_row.to_h.slice(*@columns)) if defined?(@current_row)

      ## Fill autobot column with error message
      @current_row['AutoBot'] = ex.message

    ensure
      @ws.save if @ws.dirty?
    end
  end

  def validate_sheet
    unless (val = @columns - @list.keys).empty?
      msg = "Columns Mismatch. Should include: #{@columns} Missing ones are: #{val}"
      raise GSheet::FormatError.new(@ws), msg
    end
  end
end
