require "rails_helper"

RSpec.describe GivingsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/givings").to route_to("givings#index")
    end

    it "routes to #new" do
      expect(:get => "/givings/new").to route_to("givings#new")
    end

    it "routes to #show" do
      expect(:get => "/givings/1").to route_to("givings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/givings/1/edit").to route_to("givings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/givings").to route_to("givings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/givings/1").to route_to("givings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/givings/1").to route_to("givings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/givings/1").to route_to("givings#destroy", :id => "1")
    end

  end
end
