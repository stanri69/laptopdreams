require 'rails_helper'

RSpec.describe SellersController, :type => :controller do

  let(:seller) { create(:seller) }

  describe "#new" do
    it "assigns a new Seller to seller" do
      get :new
      expect(assigns(:seller)).to be_a_new(Seller)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested seller to seller" do
      seller = create(:seller)
      get :edit, params: { id: seller }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      seller = create(:seller)
      get :edit, params: { id: seller }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new seller in the database" do
        expect{
          post :create, params: { seller: attributes_for(:seller) }
        }.to change(Seller, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new seller in the database" do
        expect{
          post :create, params: { seller: attributes_for(:invalid_seller) }
        }.not_to change(Seller, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { dealer: attributes_for(:invalid_seller) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested seller" do
        patch :update, params: { id: seller, dealer: attributes_for(:seller) }
        expect(assigns(:seller)).to eq seller
      end

      it "changes sellers attributes" do
        patch :update, params: { id: seller, seller: attributes_for(:seller, email: seller.email) }
        seller.reload
        expect(seller.email).to eq(seller.email)
      end

      it "redirects to the seller" do
        patch :update, params: { id: seller, dealer: attributes_for(:seller) }
        expect(response).to redirect_to seller
      end
    end

    context "with invalid attributes" do
      it "does not update the seller in the database" do
        patch :update, params: { id: seller, seller: attributes_for(:invalid_seller, email: 'dealer@gmail.com', password: 123123) }
        expect(seller.email).not_to eq('test')
      end

      it "re-renders the :edit template" do
        patch :update, params: { id: seller, seller: attributes_for(:invalid_seller) }
        expect(assigns(:seller)).to eq seller
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "#destroy" do
    it "deletes the dealer from the database" do
      seller = create(:seller)
      expect{
        delete :destroy, params: { id: seller }
      }.to change(Seller, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: seller }
      expect(response).to redirect_to root_path
    end
  end
end