require "google_drive"
require "ostruct"

class GSheet
  attr_accessor :sheet
  extend Dry::Configurable

  setting :auth_json
  setting :sheet_id
  setting :program_sheet_title, reader: true
  setting :participant_sheet_title, reader: true

  def self.get
    self.config.auth_json = ENV['SHEET_AUTH_JSON']
    self.config.sheet_id = ENV['SHEET_ID']
    self.config.program_sheet_title = ENV['PROGRAM_SHEET_TITLE']
    self.config.participant_sheet_title = ENV['PARTICIPANT_SHEET_TITLE']

        path = "./config.json"
      File.open(path, "w") { |f| f.write(config.auth_json) } if File.read(path).empty?
    session = GoogleDrive::Session.from_config path

    sheet = session.spreadsheet_by_key config.sheet_id
    sheet.worksheet_by_title GSheet.participant_sheet_title
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
