require 'rails_helper'

RSpec.describe LaptopsController, :type => :controller do

  login_seller

  let(:laptop) { create(:laptop) }
  let(:valid_session) { {} }

  describe "#index" do
    it "has a 200 status code" do
      get :index, params: {}, session: valid_session
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Laptop to laptop" do
      get :new
      expect(assigns(:laptop)).to be_a_new(Laptop)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested laptop to laptop" do
      laptop = create(:laptop)
      get :edit, params: { id: laptop }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      laptop = create(:laptop)
      get :edit, params: { id: laptop }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new laptop in the database" do
        expect{
          post :create, params: { laptop: attributes_for(:laptop) }
        }.to change(Laptop, :count).by(1)
      end

      it "redirects to laptops#show" do
        post :create, params: { car: attributes_for(:laptop) }
        expect(response).to redirect_to(laptop_path(assigns[:laptop]))
      end
    end

    context "with invalid attributes" do
      it "does not save the new laptop in the database" do
        expect{
          post :create, params: { laptop: attributes_for(:invalid_laptop) }
        }.not_to change(Laptop, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { laptop: attributes_for(:invalid_laptop) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#show" do
    it "assigns the requested laptop to laptop" do
      laptop = create(:laptop)
      get :show, params: { id: laptop }
      expect(assigns(:laptop)).to eq laptop
    end

    it "renders the :show template" do
      laptop = create(:laptop)
      get :show, params: { id: laptop }
      expect(response).to render_template :show
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested laptop" do
        patch :update, params: { id: laptop, car: attributes_for(:laptop) }
        expect(assigns(:laptop)).to eq laptop
      end

      it "changes laptops attributes" do
        patch :update, params: { id: laptop, car: attributes_for(:laptop, full_name: laptop.full_name) }
        laptop.reload
        expect(laptop.full_name).to eq(laptop.full_name)
      end

      it "redirects to the laptop" do
        patch :update, params: { id: laptop, laptop: attributes_for(:laptop) }
        expect(response).to redirect_to laptop
      end
    end

    context "with invalid attributes" do
      it "does not update the laptop in the database" do
        patch :update, params: { id: laptop, laptop: attributes_for(:invalid_laptop, full_name: 'acer', price: 12) }
        expect(laptop.full_name).not_to eq('acer')
      end

      it "re-renders the :edit template" do
        patch :update, params: { id: laptop, car: attributes_for(:invalid_laptop) }
        expect(assigns(:laptop)).to eq laptop
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "#destroy" do
    it "deletes the laptop from the database" do
      laptop = create(:laptop)
      expect{
        delete :destroy, params: { id: laptop }
      }.to change(Laptop, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: laptop }
      expect(response).to redirect_to laptops_path
    end
  end
end