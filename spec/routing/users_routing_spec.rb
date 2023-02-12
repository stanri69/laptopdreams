require "rails_helper"

RSpec.describe UsersController, type: :routing do

  describe "routing" do
    it "routes to #new" do
      expect(get: "/users/sign_up").to route_to("devise/registrations#new")
    end

    it "routes to #create" do
      expect(post: "/users").to route_to("devise/registrations#create")
    end

    it "routes to #destroy" do
      expect(delete: "/users").to route_to("devise/registrations#destroy")
    end
  end
end