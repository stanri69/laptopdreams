require 'rails_helper'

RSpec.describe "/additionallies", type: :request do

  let(:additionally) { create(:additionally) }

  describe "GET /index" do
    it "renders a successful response" do
      get additionallies_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      additionally = create(:additionally)
      get additionally_path(additionally)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_additionally_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      additionally = create(:additionally)
      get edit_additionally_path(additionally)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Additionally" do
        expect {
          post additionallies_path, params: { additionally: attributes_for(:additionally) }
        }.to change(Additionally, :count).by(1)
      end

      it "redirects to the created additionally" do
        post additionallies_path, params: { additionally: attributes_for(:additionally) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Additionally" do
          expect {
            post additionallies_path, params: { additionally: attributes_for(:invalid_additionally) }
          }.to change(Additionally, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post additionallies_path, params: { additionally: attributes_for(:invalid_additionally) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:additionally) { create(:additionally) }

      it "updates the requested additionally" do
        additionally = create(:additionally)
        patch additionally_path(additionally), params: { additionally: attributes_for(:additionally) }
      end

      it "redirects to the additionally" do
        additionally = create(:additionally)
        patch additionally_path(additionally), params: { additionally: attributes_for(:additionally) }
        expect(response).to redirect_to(additionally_path(additionally))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested additionally" do
      additionally = create(:additionally)
      expect {
        delete additionally_path(additionally)
      }.to change(Additionally, :count).by(-1)
    end

    it "redirects to the additionallies list" do
      additionally = create(:additionally)
      delete additionally_path(additionally)
      expect(response).to redirect_to(root_path)
    end
  end
end
