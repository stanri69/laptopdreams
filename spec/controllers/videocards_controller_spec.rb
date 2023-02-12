require 'rails_helper'

RSpec.describe VideocardsController, :type => :controller do

  let(:videocard) { create(:videocard) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Videocard to videocard" do
      get :new
      expect(assigns(:videocard)).to be_a_new(Videocard)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested videocard to videocard" do
      videocard = create(:videocard)
      get :edit, params: { id: videocard }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      videocard = create(:videocard)
      get :edit, params: { id: videocard }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new videocard in the database" do
        expect{
          post :create, params: { videocard: attributes_for(:videocard) }
        }.to change(Videocard, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new videocard in the database" do
        expect{
          post :create, params: { videocard: attributes_for(:invalid_videocard) }
        }.not_to change(Videocard, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { videocard: attributes_for(:invalid_videocard) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested videocard" do
        patch :update, params: { id: videocard, videocard: attributes_for(:videocard) }
        expect(assigns(:videocard)).to eq videocard
      end

      it "changes videocard attributes" do
        patch :update, params: { id: videocard, videocard: attributes_for(:videocard, name: videocard.name) }
        expect(videocard.name).to eq(videocard.name)
      end

      it "redirects to the videocard" do
        patch :update, params: { id: videocard, videocard: attributes_for(:videocard) }
        expect(response).to redirect_to videocard
      end
    end

    context "with invalid attributes" do
      it "does not update the videocard in the database" do
        patch :update, params: { id: videocard, videocard: attributes_for(:invalid_videocard, name: "sa", description: "sd") }
        expect(videocard.name).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the videocard from the database" do
      videocard = create(:videocard)
      expect{
        delete :destroy, params: { id: videocard }
      }.to change(Videocard, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: videocard }
      expect(response).to redirect_to root_path
    end
  end
end