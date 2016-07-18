require "rails_helper"

RSpec.describe GivingTypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/giving_types").to route_to("giving_types#index")
    end

    it "routes to #new" do
      expect(:get => "/giving_types/new").to route_to("giving_types#new")
    end

    it "routes to #show" do
      expect(:get => "/giving_types/1").to route_to("giving_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/giving_types/1/edit").to route_to("giving_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/giving_types").to route_to("giving_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/giving_types/1").to route_to("giving_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/giving_types/1").to route_to("giving_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/giving_types/1").to route_to("giving_types#destroy", :id => "1")
    end

  end
end
