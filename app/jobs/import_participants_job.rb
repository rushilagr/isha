class ImportParticipantsJob
  include SuckerPunch::Job

  def perform file_path
    ImportCSV.for_each_row file_path do |row|
      next if Participant.find_by(pid: row.fetch('pid'))

      pin_code = PinCode.find_by(string: row.fetch('pin_code')) || PinCode.find_by(string: '')

      date_parser = -> (str) do
        (str == '' || str.nil?) ? nil : Date.strptime(str, "%d-%m-%Y")
      end

      Participant.create!({
        pin_code_id: pin_code.id,
        pid: row.fetch('pid'),
        name: row.fetch('name'),
        phone: row.fetch('phone'),
        email: row.fetch('email'),
        occupation: row.fetch('occupation'),
        company: row.fetch('company'),
        gender: row.fetch('gender'),
        i_e_program_type: row.fetch('i_e_program_type'),
        i_e_center: row.fetch('i_e_center'),
        i_e_teacher: row.fetch('i_e_teacher'),

        dob: date_parser.( row.fetch 'dob' ),
        i_e_date: date_parser.( row.fetch 'i_e_date' ),
        shoonya_date: date_parser.( row.fetch 'shoonya_date' ),
        bsp_date: date_parser.( row.fetch 'bsp_date' ),
        silence_date: date_parser.( row.fetch 'silence_date' ),
        hata_yoga_date: date_parser.( row.fetch 'hata_yoga_date' ),
      })
    end

    Rails.logger.info "Participants Imported!"
  end
end
