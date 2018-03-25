require "rails_helper"

RSpec.describe CentersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/centers").to route_to("centers#index")
    end

    it "routes to #new" do
      expect(:get => "/centers/new").to route_to("centers#new")
    end

    it "routes to #show" do
      expect(:get => "/centers/1").to route_to("centers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/centers/1/edit").to route_to("centers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/centers").to route_to("centers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/centers/1").to route_to("centers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/centers/1").to route_to("centers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/centers/1").to route_to("centers#destroy", :id => "1")
    end

  end
end
