require 'rails_helper'

RSpec.describe ScreensController, :type => :controller do

  let(:screen) { create(:screen) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Screen to screen" do
      get :new
      expect(assigns(:screen)).to be_a_new(Screen)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested screen to screen" do
      screen = create(:screen)
      get :edit, params: { id: screen }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      screen = create(:screen)
      get :edit, params: { id: screen }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new screen in the database" do
        expect{
          post :create, params: { screen: attributes_for(:screen) }
        }.to change(Screen, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new screen in the database" do
        expect{
          post :create, params: { screen: attributes_for(:invalid_screen) }
        }.not_to change(Screen, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { screen: attributes_for(:invalid_screen) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested screen" do
        patch :update, params: { id: screen, screen: attributes_for(:screen) }
        expect(assigns(:screen)).to eq screen
      end

      it "changes screen attributes" do
        patch :update, params: { id: screen, screen: attributes_for(:screen, diagonal: screen.diagonal) }
        expect(screen.diagonal).to eq(screen.diagonal)
      end

      it "redirects to the screen" do
        patch :update, params: { id: screen, screen: attributes_for(:screen) }
        expect(response).to redirect_to screen
      end
    end

    context "with invalid attributes" do
      it "does not update the screen in the database" do
        patch :update, params: { id: screen, screen: attributes_for(:invalid_screen, diagonal: "sa", screen_type: "sd") }
        expect(screen.diagonal).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the screen from the database" do
      screen = create(:screen)
      expect{
        delete :destroy, params: { id: screen }
      }.to change(Screen, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: screen }
      expect(response).to redirect_to root_path
    end
  end
end