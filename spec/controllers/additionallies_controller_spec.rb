require 'rails_helper'

RSpec.describe AdditionalliesController, :type => :controller do

  let(:additionally) { create(:additionally) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Additionally to additionally" do
      get :new
      expect(assigns(:additionally)).to be_a_new(Additionally)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested additionally to additionally" do
      additionally = create(:additionally)
      get :edit, params: { id: additionally }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      additionally = create(:additionally)
      get :edit, params: { id: additionally }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new additionally in the database" do
        expect{
          post :create, params: { additionally: attributes_for(:additionally) }
        }.to change(Additionally, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new additionally in the database" do
        expect{
          post :create, params: { additionally: attributes_for(:invalid_additionally) }
        }.not_to change(Additionally, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { additionally: attributes_for(:invalid_additionally) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested additionally" do
        patch :update, params: { id: additionally, additionally: attributes_for(:additionally) }
        expect(assigns(:additionally)).to eq additionally
      end

      it "changes additionallies attributes" do
        patch :update, params: { id: additionally, additionally: attributes_for(:additionally, supply_set: additionally.supply_set) }
        expect(additionally.supply_set).to eq(additionally.supply_set)
      end

      it "redirects to the additionally" do
        patch :update, params: { id: additionally, additionally: attributes_for(:additionally) }
        expect(response).to redirect_to additionally
      end
    end

    context "with invalid attributes" do
      it "does not update the additionally in the database" do
        patch :update, params: { id: additionally, additionally: attributes_for(:invalid_additionally, supply_set: 'das', guarantee: 2) }
        expect(additionally.supply_set).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the additionally from the database" do
      additionally = create(:additionally)
      expect{
        delete :destroy, params: { id: additionally }
      }.to change(Additionally, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: additionally }
      expect(response).to redirect_to root_path
    end
  end
end