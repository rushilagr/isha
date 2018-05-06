require './lib/utils/g_sheet.rb'

GSheet.configure do |c|
  c.auth_json = ENV['SHEET_AUTH_JSON']
  c.sheet_id = ENV['SHEET_ID']
  c.program_sheet_title = ENV['PROGRAM_SHEET_TITLE']
  c.participant_sheet_title = ENV['PARTICIPANT_SHEET_TITLE']
end
