require "rails_helper"

RSpec.describe SellersController, type: :routing do

  describe "routing" do
    it "routes to #new" do
      expect(get: "/sellers/sign_up").to route_to("devise/registrations#new")
    end

    it "routes to #create" do
      expect(post: "/sellers").to route_to("devise/registrations#create")
    end

    it "routes to #destroy" do
      expect(delete: "/sellers").to route_to("devise/registrations#destroy")
    end
  end
end