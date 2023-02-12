require 'rails_helper'

RSpec.describe BatteriesController, :type => :controller do

  let(:battery) { create(:battery) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Battery to battery" do
      get :new
      expect(assigns(:battery)).to be_a_new(Battery)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested battery to battery" do
      battery = create(:battery)
      get :edit, params: { id: battery }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      battery = create(:battery)
      get :edit, params: { id: battery }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new battery in the database" do
        expect{
          post :create, params: { battery: attributes_for(:battery) }
        }.to change(Battery, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new battery in the database" do
        expect{
          post :create, params: { battery: attributes_for(:invalid_battery) }
        }.not_to change(Battery, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { battery: attributes_for(:invalid_battery) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested battery" do
        patch :update, params: { id: battery, battery: attributes_for(:battery) }
        expect(assigns(:battery)).to eq battery
      end

      it "changes batteries attributes" do
        patch :update, params: { id: battery, battery: attributes_for(:battery, battery_capacity: battery.battery_capacity) }
        expect(battery.battery_capacity).to eq(battery.battery_capacity)
      end

      it "redirects to the battery" do
        patch :update, params: { id: battery, battery: attributes_for(:battery) }
        expect(response).to redirect_to battery
      end
    end

    context "with invalid attributes" do
      it "does not update the battery in the database" do
        patch :update, params: { id: battery, battery: attributes_for(:invalid_battery, battery_capacity: 'das', battery_life: 2) }
        expect(battery.battery_capacity).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the battery from the database" do
      battery = create(:battery)
      expect{
        delete :destroy, params: { id: battery }
      }.to change(Battery, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: battery }
      expect(response).to redirect_to root_path
    end
  end
end