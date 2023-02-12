require 'rails_helper'

RSpec.describe "/corps", type: :request do

  let(:corp) { create(:corp) }

  describe "GET /index" do
    it "renders a successful response" do
      get corps_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      corp = create(:corp)
      get corp_path(corp)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_corp_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      corp = create(:corp)
      get edit_corp_path(corp)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Corp" do
        expect {
          post corps_path, params: { corp: attributes_for(:corp) }
        }.to change(Corp, :count).by(1)
      end

      it "redirects to the created corp" do
        post corps_path, params: { corp: attributes_for(:corp) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Corp" do
          expect {
            post corps_path, params: { corp: attributes_for(:invalid_corp) }
          }.to change(Corp, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post corps_path, params: { corp: attributes_for(:invalid_corp) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:corp) { create(:corp) }

      it "updates the requested corp" do
        corp = create(:corp)
        patch corp_path(corp), params: { corp: attributes_for(:corp) }
      end

      it "redirects to the corp" do
        corp = create(:corp)
        patch corp_path(corp), params: { corp: attributes_for(:corp) }
        expect(response).to redirect_to(corp_path(corp))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested corp" do
      corp = create(:corp)
      expect {
        delete corp_path(corp)
      }.to change(Corp, :count).by(-1)
    end

    it "redirects to the corps list" do
      corp = create(:corp)
      delete corp_path(corp)
      expect(response).to redirect_to(root_path)
    end
  end
end
