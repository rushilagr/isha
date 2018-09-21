require "rails_helper"

RSpec.describe CallTasksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/call_tasks").to route_to("call_tasks#index")
    end

    it "routes to #new" do
      expect(:get => "/call_tasks/new").to route_to("call_tasks#new")
    end

    it "routes to #show" do
      expect(:get => "/call_tasks/1").to route_to("call_tasks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/call_tasks/1/edit").to route_to("call_tasks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/call_tasks").to route_to("call_tasks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/call_tasks/1").to route_to("call_tasks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/call_tasks/1").to route_to("call_tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/call_tasks/1").to route_to("call_tasks#destroy", :id => "1")
    end

  end
end
