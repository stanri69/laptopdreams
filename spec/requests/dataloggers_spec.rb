require 'rails_helper'

RSpec.describe "/dataloggers", type: :request do

  let(:datalogger) { create(:datalogger) }

  describe "GET /index" do
    it "renders a successful response" do
      get dataloggers_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      datalogger = create(:datalogger)
      get datalogger_path(datalogger)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_datalogger_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      datalogger = create(:datalogger)
      get edit_datalogger_path(datalogger)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Datalogger" do
        expect {
          post dataloggers_path, params: { datalogger: attributes_for(:datalogger) }
        }.to change(Datalogger, :count).by(1)
      end

      it "redirects to the created datalogger" do
        post dataloggers_path, params: { datalogger: attributes_for(:datalogger) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Datalogger" do
          expect {
            post dataloggers_path, params: { datalogger: attributes_for(:invalid_datalogger) }
          }.to change(Datalogger, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post dataloggers_path, params: { datalogger: attributes_for(:invalid_datalogger) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:datalogger) { create(:datalogger) }

      it "updates the requested datalogger" do
        datalogger = create(:datalogger)
        patch datalogger_path(datalogger), params: { datalogger: attributes_for(:datalogger) }
      end

      it "redirects to the datalogger" do
        datalogger = create(:datalogger)
        patch datalogger_path(datalogger), params: { datalogger: attributes_for(:datalogger) }
        expect(response).to redirect_to(datalogger_path(datalogger))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested datalogger" do
      datalogger = create(:datalogger)
      expect {
        delete datalogger_path(datalogger)
      }.to change(Datalogger, :count).by(-1)
    end

    it "redirects to the dataloggers list" do
      datalogger = create(:datalogger)
      delete datalogger_path(datalogger)
      expect(response).to redirect_to(root_path)
    end
  end
end
