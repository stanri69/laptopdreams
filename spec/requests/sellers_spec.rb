require 'rails_helper'

RSpec.describe "/sellers", type: :request do

  let(:seller) { create(:seller) }

  describe "GET /index" do
    it "renders a successful response" do
      get root_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_seller_session_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Seller" do
        expect {
          post new_seller_session_path, params: { seller: attributes_for(:seller) }
        }.to change(Seller, :count).by(1)
      end

      it "redirects to the created seller" do
        post root_path, params: { seller: attributes_for(:seller) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Seller" do
          expect {
            post root_path, params: { seller: attributes_for(:invalid_seller) }
          }.to change(Seller, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post root_path, params: { seller: attributes_for(:invalid_seller) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested dealer" do
      seller = create(:seller)
      expect {
        seller destroy_seller_session_path(seller)
      }.to change(Seller, :count).by(-1)
    end

    it "redirects to the laptops list" do
      seller = create(:seller)
      delete destroy_seller_session_path(seller)
      expect(response).to redirect_to(root_path)
    end
  end
end