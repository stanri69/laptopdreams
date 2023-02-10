require "rails_helper"

RSpec.describe ScreensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/screens").to route_to("screens#index")
    end

    it "routes to #new" do
      expect(get: "/screens/new").to route_to("screens#new")
    end

    it "routes to #show" do
      expect(get: "/screens/1").to route_to("screens#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/screens/1/edit").to route_to("screens#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/screens").to route_to("screens#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/screens/1").to route_to("screens#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/screens/1").to route_to("screens#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/screens/1").to route_to("screens#destroy", id: "1")
    end
  end
end
