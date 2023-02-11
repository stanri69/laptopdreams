require 'rails_helper'

RSpec.describe "/batteries", type: :request do

  let(:battery) { create(:battery) }

  describe "GET /index" do
    it "renders a successful response" do
      get batteries_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      battery = create(:battery)
      get battery_path(battery)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_battery_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      battery = create(:battery)
      get edit_battery_path(battery)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Battery" do
        expect {
          post batteries_path, params: { battery: attributes_for(:battery) }
        }.to change(Battery, :count).by(1)
      end

      it "redirects to the created battery" do
        post batteries_path, params: { battery: attributes_for(:battery) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Battery" do
          expect {
            post batteries_path, params: { battery: attributes_for(:invalid_battery) }
          }.to change(Battery, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post batteries_path, params: { battery: attributes_for(:invalid_battery) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:battery) { create(:battery) }

      it "updates the requested battery" do
        battery = create(:battery)
        patch battery_path(battery), params: { battery: attributes_for(:battery) }
      end

      it "redirects to the battery" do
        battery = create(:battery)
        patch battery_path(battery), params: { battery: attributes_for(:battery) }
        expect(response).to redirect_to(battery_path(battery))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested battery" do
      battery = create(:battery)
      expect {
        delete battery_path(battery)
      }.to change(Battery, :count).by(-1)
    end

    it "redirects to the batteries list" do
      battery = create(:battery)
      delete battery_path(battery)
      expect(response).to redirect_to(root_path)
    end
  end
end
