require "rails_helper"

RSpec.describe DataloggersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dataloggers").to route_to("dataloggers#index")
    end

    it "routes to #new" do
      expect(get: "/dataloggers/new").to route_to("dataloggers#new")
    end

    it "routes to #show" do
      expect(get: "/dataloggers/1").to route_to("dataloggers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dataloggers/1/edit").to route_to("dataloggers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dataloggers").to route_to("dataloggers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dataloggers/1").to route_to("dataloggers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dataloggers/1").to route_to("dataloggers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dataloggers/1").to route_to("dataloggers#destroy", id: "1")
    end
  end
end
