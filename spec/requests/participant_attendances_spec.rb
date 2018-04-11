require 'rails_helper'

RSpec.describe "ParticipantAttendances", type: :request do
  describe "GET /participant_attendances" do
    it "works! (now write some real specs)" do
      get participant_attendances_path
      expect(response).to have_http_status(200)
    end
  end
end
