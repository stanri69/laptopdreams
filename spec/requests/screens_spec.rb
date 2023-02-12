require 'rails_helper'

RSpec.describe "/screens", type: :request do

  let(:screen) { create(:screen) }

  describe "GET /index" do
    it "renders a successful response" do
      get screens_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      screen = create(:screen)
      get screen_path(screen)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_screen_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      screen = create(:screen)
      get edit_screen_path(screen)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Screen" do
        expect {
          post screens_path, params: { screen: attributes_for(:screen) }
        }.to change(Screen, :count).by(1)
      end

      it "redirects to the created screen" do
        post screens_path, params: { screen: attributes_for(:screen) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Screen" do
          expect {
            post screens_path, params: { screen: attributes_for(:invalid_screen) }
          }.to change(Screen, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post screens_path, params: { screen: attributes_for(:invalid_screen) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:screen) { create(:screen) }

      it "updates the requested screen" do
        screen = create(:screen)
        patch screen_path(screen), params: { screen: attributes_for(:screen) }
      end

      it "redirects to the screen" do
        screen = create(:screen)
        patch screen_path(screen), params: { screen: attributes_for(:screen) }
        expect(response).to redirect_to(screen_path(screen))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested screen" do
      screen = create(:screen)
      expect {
        delete screen_path(screen)
      }.to change(Screen, :count).by(-1)
    end

    it "redirects to the screens list" do
      screen = create(:screen)
      delete screen_path(screen)
      expect(response).to redirect_to(root_path)
    end
  end
end
