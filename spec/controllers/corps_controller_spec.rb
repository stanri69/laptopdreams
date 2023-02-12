require 'rails_helper'

RSpec.describe CorpsController, :type => :controller do

  let(:corp) { create(:corp) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Corp to corp" do
      get :new
      expect(assigns(:corp)).to be_a_new(Corp)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested corp to corp" do
      corp = create(:corp)
      get :edit, params: { id: corp }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      corp = create(:corp)
      get :edit, params: { id: corp }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new corp in the database" do
        expect{
          post :create, params: { corp: attributes_for(:corp) }
        }.to change(Corp, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new corp in the database" do
        expect{
          post :create, params: { corp: attributes_for(:invalid_corp) }
        }.not_to change(Corp, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { corp: attributes_for(:invalid_corp) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested corp" do
        patch :update, params: { id: corp, corp: attributes_for(:corp) }
        expect(assigns(:corp)).to eq corp
      end

      it "changes corp attributes" do
        patch :update, params: { id: corp, corp: attributes_for(:corp, color: corp.color) }
        expect(corp.color).to eq(corp.color)
      end

      it "redirects to the corp" do
        patch :update, params: { id: corp, corp: attributes_for(:corp) }
        expect(response).to redirect_to corp
      end
    end

    context "with invalid attributes" do
      it "does not update the corp in the database" do
        patch :update, params: { id: corp, corp: attributes_for(:invalid_corp, color: 'das', weight: 1) }
        expect(corp.color).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the corp from the database" do
      corp = create(:corp)
      expect{
        delete :destroy, params: { id: corp }
      }.to change(Corp, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: corp }
      expect(response).to redirect_to root_path
    end
  end
end