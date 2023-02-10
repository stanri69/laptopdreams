require "rails_helper"

RSpec.describe RamsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rams").to route_to("rams#index")
    end

    it "routes to #new" do
      expect(get: "/rams/new").to route_to("rams#new")
    end

    it "routes to #show" do
      expect(get: "/rams/1").to route_to("rams#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/rams/1/edit").to route_to("rams#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rams").to route_to("rams#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rams/1").to route_to("rams#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rams/1").to route_to("rams#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rams/1").to route_to("rams#destroy", id: "1")
    end
  end
end
