require "rails_helper"

RSpec.describe MeditatorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/meditators").to route_to("meditators#index")
    end

    it "routes to #new" do
      expect(:get => "/meditators/new").to route_to("meditators#new")
    end

    it "routes to #show" do
      expect(:get => "/meditators/1").to route_to("meditators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/meditators/1/edit").to route_to("meditators#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/meditators").to route_to("meditators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/meditators/1").to route_to("meditators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/meditators/1").to route_to("meditators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/meditators/1").to route_to("meditators#destroy", :id => "1")
    end

  end
end
