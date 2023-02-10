require "rails_helper"

RSpec.describe AdditionalliesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/additionallies").to route_to("additionallies#index")
    end

    it "routes to #new" do
      expect(get: "/additionallies/new").to route_to("additionallies#new")
    end

    it "routes to #show" do
      expect(get: "/additionallies/1").to route_to("additionallies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/additionallies/1/edit").to route_to("additionallies#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/additionallies").to route_to("additionallies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/additionallies/1").to route_to("additionallies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/additionallies/1").to route_to("additionallies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/additionallies/1").to route_to("additionallies#destroy", id: "1")
    end
  end
end
