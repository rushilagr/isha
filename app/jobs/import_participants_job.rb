class ImportParticipantsJob
  include SuckerPunch::Job

  def perform file_path
    ImportCSV.for_each_row file_path do
      next if Participant.find_by pid: row.fetch('pid')

      pin_code = PinCode.find_by string: row.fetch('pin_code')

      date_parser = -> (str) { Date.strptime str, "%m/%d/%Y" }

      Participant.create!({
        pin_code_id: pin_code.id,
        pid: row.fetch('pid'),
        name: row.fetch('name'),
        phone: row.fetch('phone'),
        email: row.fetch('email'),
        occupation: row.fetch('occupation'),
        company: row.fetch('company'),
        gender: row.fetch('gender'),
        first_program: row.fetch('first_program'),
        first_program_center: row.fetch('first_program_center'),
        first_program_teacher: row.fetch('first_program_teacher'),

        dob: date_parser( row.fetch 'dob' ),
        first_program_date: date_parser( row.fetch 'first_program_date' ),
        shoonya_date: date_parser( row.fetch 'shoonya_date' ),
        bsp_date: date_parser( row.fetch 'bsp_date' ),
        silence_date: date_parser( row.fetch 'silence_date' ),
        hata_yoga_date: date_parser( row.fetch 'hata_yoga_date' ),
      })
    end

    Rails.logger.info "Participants Imported!"
  end
end
