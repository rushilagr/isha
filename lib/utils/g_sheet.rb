require "google_drive"
require "ostruct"

class GSheet
  attr_accessor :sheet
  extend Dry::Configurable

  setting :auth_json
  setting :sheet_id
  setting :program_sheet_title, reader: true
  setting :participant_sheet_title, reader: true


  def self.initialize
    File.open(path = "./config.json","w") do |f|
      f.write(config.auth_json)
    end
    session = GoogleDrive::Session.from_config path

    @sheet = session.spreadsheet_by_key config.sheet_id
  end
end

## --------------------------------------------------------
## ERRORS
## --------------------------------------------------------

class GSheet
  class SheetError < StandardError
    attr_reader :object

    def initialize(object)
      @object = object
    end
  end

  class FormatError < SheetError
  end
end
