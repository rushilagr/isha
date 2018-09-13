class ImportPinCodesJob
  include SuckerPunch::Job

  def perform file_path

    ## Create dummy rows for empty pin_code
    Circle.create!([ { coordinator: '', name: 'DUMMY'}, ])
    Sector.create!([ { coordinator: '', name: 'DUMMY', circle_id: Circle.find_by(name: 'DUMMY').id}, ])
    Center.create!([ { coordinator: '', name: 'DUMMY', sector_id: Sector.find_by(name: 'DUMMY').id}, ])
    PinCode.create!([ { string: '', state: '', center_id: Center.find_by(name: 'DUMMY').id}, ])


    ImportCSV.for_each_row file_path do |row|
      next if PinCode.find_by(string: row.fetch('pin_code'))
      # next if row.fetch('sector') == 'OutOfDelhiCircle'

      circle = Circle.find_or_create_by! name: row.fetch('circle'), coordinator: row.fetch('circle_coordinator')
      sector = Sector.find_or_create_by! name: row.fetch('sector'), coordinator: row.fetch('sector_coordinator'), circle_id: circle.id
      center = Center.find_or_create_by! name: row.fetch('center'), coordinator: row.fetch('center_coordinator'), sector_id: sector.id
      PinCode.create! string: row.fetch('pin_code'), lat: row.fetch('lat'), lng: row.fetch('lng'), state: row.fetch('state'), center_id: center.id
    end

    Rails.logger.info "PinCodes Imported!"
  end
end
