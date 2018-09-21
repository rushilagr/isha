require 'rails_helper'

RSpec.describe "CallTasks", type: :request do
  describe "GET /call_tasks" do
    it "works! (now write some real specs)" do
      get call_tasks_path
      expect(response).to have_http_status(200)
    end
  end
end
