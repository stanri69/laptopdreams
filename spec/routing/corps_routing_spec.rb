require "rails_helper"

RSpec.describe CorpsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/corps").to route_to("corps#index")
    end

    it "routes to #new" do
      expect(get: "/corps/new").to route_to("corps#new")
    end

    it "routes to #show" do
      expect(get: "/corps/1").to route_to("corps#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/corps/1/edit").to route_to("corps#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/corps").to route_to("corps#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/corps/1").to route_to("corps#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/corps/1").to route_to("corps#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/corps/1").to route_to("corps#destroy", id: "1")
    end
  end
end
