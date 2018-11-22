module ImportPinCodesJob
  def self.call file_path, async, caller_phone
    CreateDefaultPinCodes.pre_import_defaults

    required_headers = ['pin_code', 'circle', 'circle_coordinator', 'sector', 'sector_coordinator', 'center', 'center_coordinator', 'lat', 'lng', 'state']
    on_each_row_do = -> (row) {
      next if PinCode.find_by(string: row.fetch('pin_code'))
      # next if row.fetch('sector') == 'OutOfDelhiCircle'

      circle = Circle.find_or_create_by! name: row.fetch('circle'), coordinator: row.fetch('circle_coordinator')
      sector = Sector.find_or_create_by! name: row.fetch('sector'), coordinator: row.fetch('sector_coordinator'), circle_id: circle.id
      center = Center.find_or_create_by! name: row.fetch('center'), coordinator: row.fetch('center_coordinator'), sector_id: sector.id
      PinCode.create! string: row.fetch('pin_code'), lat: row.fetch('lat'), lng: row.fetch('lng'), state: row.fetch('state'), center_id: center.id
    }

    post_import_block = -> { CreateDefaultPinCodes.post_import_defaults }

    ImportCSV.new(on_each_row_do, required_headers, file_path, async, caller_phone, post_import_block).call
  end
end
