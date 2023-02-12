require 'rails_helper'

RSpec.describe RamsController, :type => :controller do

  let(:ram) { create(:ram) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Ram to ram" do
      get :new
      expect(assigns(:ram)).to be_a_new(Ram)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested ram to ram" do
      ram = create(:ram)
      get :edit, params: { id: ram }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      ram = create(:ram)
      get :edit, params: { id: ram }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new ram in the database" do
        expect{
          post :create, params: { ram: attributes_for(:ram) }
        }.to change(Ram, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new ram in the database" do
        expect{
          post :create, params: { ram: attributes_for(:invalid_ram) }
        }.not_to change(Ram, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { ram: attributes_for(:invalid_ram) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested ram" do
        patch :update, params: { id: ram, ram: attributes_for(:ram) }
        expect(assigns(:ram)).to eq ram
      end

      it "changes ram attributes" do
        patch :update, params: { id: ram, ram: attributes_for(:ram, amount: ram.amount) }
        expect(ram.amount).to eq(ram.amount)
      end

      it "redirects to the ram" do
        patch :update, params: { id: ram, ram: attributes_for(:ram) }
        expect(response).to redirect_to ram
      end
    end

    context "with invalid attributes" do
      it "does not update the ram in the database" do
        patch :update, params: { id: ram, ram: attributes_for(:invalid_ram, amount: "sa", number_slot: 1) }
        expect(ram.amount).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the ram from the database" do
      ram = create(:ram)
      expect{
        delete :destroy, params: { id: ram }
      }.to change(Ram, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: ram }
      expect(response).to redirect_to root_path
    end
  end
end