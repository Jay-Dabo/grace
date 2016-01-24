require "rails_helper"

RSpec.describe ChurchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/churches").to route_to("churches#index")
    end

    it "routes to #new" do
      expect(:get => "/churches/new").to route_to("churches#new")
    end

    it "routes to #show" do
      expect(:get => "/churches/1").to route_to("churches#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/churches/1/edit").to route_to("churches#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/churches").to route_to("churches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/churches/1").to route_to("churches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/churches/1").to route_to("churches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/churches/1").to route_to("churches#destroy", :id => "1")
    end

  end
end
