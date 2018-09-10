namespace :import do
  desc "Importing data from csvs"

  task pin_code_and_related_csv: :environment do |task, args|
    require 'pry'
    require 'pry-rails'
    require 'pry-byebug'

    require 'csv'

    # Boiler plate for passing args through rake
    ARGV.each { |a| task a.to_sym do ; end }
    file_path = ARGV[1]

    file = File.read file_path
    csv = CSV.parse(file, headers: true)

    csv.each_with_index do |row, i|
      begin
        puts "Progress #{(i/csv.count * 100).round(2)}%" if i%10 == 0

        row = row.to_hash.transform_keys(&:underscore)

        # Skip of pincode already exists OR sector is OutOfDelhi
        next if PinCode.find_by(string: row.fetch('pin_code'))
        next if row.fetch('sector') == 'OutOfDelhiCircle'

        circle = Circle.find_or_create_by! name: row.fetch('circle'), coordinator: row.fetch('circle_coordinator')
        sector = Sector.find_or_create_by! name: row.fetch('sector'), coordinator: row.fetch('sector_coordinator'), circle_id: circle.id
        center = Center.find_or_create_by! name: row.fetch('center'), coordinator: row.fetch('center_coordinator'), sector_id: sector.id
        PinCode.create! string: row.fetch('pin_code'), lat: row.fetch('lat'), lng: row.fetch('lng'), state: row.fetch('state'), center_id: center.id

      rescue StandardError => ex
        puts "Error row ##{i + 1}"
        raise ex

      end
    end
  end

end
