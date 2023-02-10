require "rails_helper"

RSpec.describe VideocardsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/videocards").to route_to("videocards#index")
    end

    it "routes to #new" do
      expect(get: "/videocards/new").to route_to("videocards#new")
    end

    it "routes to #show" do
      expect(get: "/videocards/1").to route_to("videocards#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/videocards/1/edit").to route_to("videocards#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/videocards").to route_to("videocards#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/videocards/1").to route_to("videocards#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/videocards/1").to route_to("videocards#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/videocards/1").to route_to("videocards#destroy", id: "1")
    end
  end
end
