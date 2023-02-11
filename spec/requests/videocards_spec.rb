require 'rails_helper'

RSpec.describe "/videocards", type: :request do

  let(:videocard) { create(:videocard) }

  describe "GET /index" do
    it "renders a successful response" do
      get videocards_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      videocard = create(:videocard)
      get videocard_path(videocard)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_videocard_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      videocard = create(:videocard)
      get edit_videocard_path(videocard)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Videocard" do
        expect {
          post videocards_path, params: { videocard: attributes_for(:videocard) }
        }.to change(Videocard, :count).by(1)
      end

      it "redirects to the created videocard" do
        post videocards_path, params: { videocard: attributes_for(:videocard) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Videocard" do
          expect {
            post videocards_path, params: { videocard: attributes_for(:invalid_videocard) }
          }.to change(Videocard, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post videocards_path, params: { videocard: attributes_for(:invalid_videocard) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:videocard) { create(:videocard) }

      it "updates the requested videocard" do
        videocard = create(:videocard)
        patch videocard_path(videocard), params: { videocard: attributes_for(:videocard) }
      end

      it "redirects to the videocard" do
        videocard = create(:videocard)
        patch videocard_path(videocard), params: { videocard: attributes_for(:videocard) }
        expect(response).to redirect_to(videocard_path(videocard))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested videocard" do
      videocard = create(:videocard)
      expect {
        delete videocard_path(videocard)
      }.to change(Videocard, :count).by(-1)
    end

    it "redirects to the videocards list" do
      videocard = create(:videocard)
      delete videocard_path(videocard)
      expect(response).to redirect_to(root_path)
    end
  end
end
