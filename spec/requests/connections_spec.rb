require 'rails_helper'

RSpec.describe "/connections", type: :request do

  let(:connection) { create(:connection) }

  describe "GET /index" do
    it "renders a successful response" do
      get connections_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      connection = create(:connection)
      get connection_path(connection)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_connection_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      connection = create(:connection)
      get edit_connection_path(connection)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Connection" do
        expect {
          post connections_path, params: { connection: attributes_for(:connection) }
        }.to change(Connection, :count).by(1)
      end

      it "redirects to the created connection" do
        post connections_path, params: { connection: attributes_for(:connection) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Connection" do
          expect {
            post connections_path, params: { connection: attributes_for(:invalid_connection) }
          }.to change(Connection, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post connections_path, params: { connection: attributes_for(:invalid_connection) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:connection) { create(:connection) }

      it "updates the requested connection" do
        connection = create(:connection)
        patch connection_path(connection), params: { connection: attributes_for(:connection) }
      end

      it "redirects to the connection" do
        connection = create(:connection)
        patch connection_path(connection), params: { connection: attributes_for(:connection) }
        expect(response).to redirect_to(connection_path(connection))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested connection" do
      connection = create(:connection)
      expect {
        delete connection_path(connection)
      }.to change(Connection, :count).by(-1)
    end

    it "redirects to the connections list" do
      connection = create(:connection)
      delete connection_path(connection)
      expect(response).to redirect_to(root_path)
    end
  end
end
