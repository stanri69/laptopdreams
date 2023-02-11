require 'rails_helper'

RSpec.describe "/users", type: :request do

  let(:user) { create(:user) }

  describe "GET /index" do
    it "renders a successful response" do
      get root_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_session_path
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post new_user_session_path, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post root_path, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new User" do
          expect {
            post root_path, params: { user: attributes_for(:invalid_user) }
          }.to change(User, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post root_path, params: { user: attributes_for(:invalid_user) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      user = create(:user)
      expect {
        delete destroy_user_session_path(user)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the laptops list" do
      user = create(:user)
      delete destroy_user_session_path(user)
      expect(response).to redirect_to(root_path)
    end
  end
end