require "rails_helper"

RSpec.describe BathsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/baths").to route_to("baths#index")
    end

    it "routes to #new" do
      expect(:get => "/baths/new").to route_to("baths#new")
    end

    it "routes to #show" do
      expect(:get => "/baths/1").to route_to("baths#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/baths/1/edit").to route_to("baths#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/baths").to route_to("baths#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/baths/1").to route_to("baths#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/baths/1").to route_to("baths#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/baths/1").to route_to("baths#destroy", :id => "1")
    end

  end
end
