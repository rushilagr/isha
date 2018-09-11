require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #import_participants" do
    it "returns http success" do
      get :import_participants
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #import_pin_codes" do
    it "returns http success" do
      get :import_pin_codes
      expect(response).to have_http_status(:success)
    end
  end

end
