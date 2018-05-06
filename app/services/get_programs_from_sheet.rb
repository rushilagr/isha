class GetProgramsFromSheet
  def self.call
    self.new.get
  end

  ## -----------------------------------------------------
  ## Instance Methods
  ## -----------------------------------------------------

  def get
    hash_array = @list.to_hash_array.uniq
    hash_array.each do |row|
      ## --------------------------------------------
      ## HERE
      ## --------------------------------------------
      Program.new row[]
    end
  end

  def initialize columns = nil
    @ws = GSHeet.new.worksheet_by_title GSheet.program_sheet_title
    @list = ws.list
    @columns = columns | ['ProgramType', 'StartDate', 'EndDate', 'Center', 'City']
    validate_sheet
  end

  private

    def validate_sheet
      unless @list.keys.sort == @columns.sort
        msg = "Columns Mismatch. Should be: #{@columns} Is: #{@list.keys}"
        raise GSheet::FormatError.new(@ws), msg
      end
    end
end
