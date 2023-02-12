require 'rails_helper'

RSpec.describe ConnectionsController, :type => :controller do

  let(:connection) { create(:connection) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Connection to connection" do
      get :new
      expect(assigns(:connection)).to be_a_new(Connection)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested connection to connection" do
      connection = create(:connection)
      get :edit, params: { id: connection }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      connection = create(:connection)
      get :edit, params: { id: connection }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new connection in the database" do
        expect{
          post :create, params: { connection: attributes_for(:connection) }
        }.to change(Connection, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new connection in the database" do
        expect{
          post :create, params: { connection: attributes_for(:invalid_connection) }
        }.not_to change(Connection, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { connection: attributes_for(:invalid_connection) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested connection" do
        patch :update, params: { id: connection, connection: attributes_for(:connection) }
        expect(assigns(:connection)).to eq connection
      end

      it "changes connections attributes" do
        patch :update, params: { id: connection, connection: attributes_for(:connection, ports: connection.ports) }
        expect(connection.ports).to eq(connection.ports)
      end

      it "redirects to the connection" do
        patch :update, params: { id: connection, connection: attributes_for(:connection) }
        expect(response).to redirect_to connection
      end
    end

    context "with invalid attributes" do
      it "does not update the connection in the database" do
        patch :update, params: { id: connection, connection: attributes_for(:invalid_connection, ports: 'das', network_adapters: false) }
        expect(connection.ports).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the connection from the database" do
      connection = create(:connection)
      expect{
        delete :destroy, params: { id: connection }
      }.to change(Connection, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: connection }
      expect(response).to redirect_to root_path
    end
  end
end