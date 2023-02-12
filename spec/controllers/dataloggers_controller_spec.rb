require 'rails_helper'

RSpec.describe DataloggersController, :type => :controller do

  let(:datalogger) { create(:datalogger) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Datalogger to datalogger" do
      get :new
      expect(assigns(:datalogger)).to be_a_new(Datalogger)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested datalogger to datalogger" do
      datalogger = create(:datalogger)
      get :edit, params: { id: datalogger }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      datalogger = create(:datalogger)
      get :edit, params: { id: datalogger }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new datalogger in the database" do
        expect{
          post :create, params: { datalogger: attributes_for(:datalogger) }
        }.to change(Datalogger, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new datalogger in the database" do
        expect{
          post :create, params: { datalogger: attributes_for(:invalid_datalogger) }
        }.not_to change(Datalogger, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { datalogger: attributes_for(:invalid_datalogger) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested datalogger" do
        patch :update, params: { id: datalogger, datalogger: attributes_for(:datalogger) }
        expect(assigns(:datalogger)).to eq datalogger
      end

      it "changes datalogger attributes" do
        patch :update, params: { id: datalogger, datalogger: attributes_for(:datalogger, volume: datalogger.volume) }
        expect(datalogger.volume).to eq(datalogger.volume)
      end

      it "redirects to the datalogger" do
        patch :update, params: { id: datalogger, datalogger: attributes_for(:datalogger) }
        expect(response).to redirect_to datalogger
      end
    end

    context "with invalid attributes" do
      it "does not update the datalogger in the database" do
        patch :update, params: { id: datalogger, datalogger: attributes_for(:invalid_datalogger, volume: 1, type_datalogger: "sa") }
        expect(datalogger.volume).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the datalogger from the database" do
      datalogger = create(:datalogger)
      expect{
        delete :destroy, params: { id: datalogger }
      }.to change(Datalogger, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: datalogger }
      expect(response).to redirect_to root_path
    end
  end
end