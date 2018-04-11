require "rails_helper"

RSpec.describe ParticipantAttendancesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/participant_attendances").to route_to("participant_attendances#index")
    end

    it "routes to #new" do
      expect(:get => "/participant_attendances/new").to route_to("participant_attendances#new")
    end

    it "routes to #show" do
      expect(:get => "/participant_attendances/1").to route_to("participant_attendances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/participant_attendances/1/edit").to route_to("participant_attendances#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/participant_attendances").to route_to("participant_attendances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/participant_attendances/1").to route_to("participant_attendances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/participant_attendances/1").to route_to("participant_attendances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/participant_attendances/1").to route_to("participant_attendances#destroy", :id => "1")
    end

  end
end
