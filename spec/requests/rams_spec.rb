require 'rails_helper'

RSpec.describe "/rams", type: :request do

  let(:ram) { create(:ram) }

  describe "GET /index" do
    it "renders a successful response" do
      get rams_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ram = create(:ram)
      get ram_path(ram)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_ram_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      ram = create(:ram)
      get edit_ram_path(ram)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Ram" do
        expect {
          post rams_path, params: { ram: attributes_for(:ram) }
        }.to change(Ram, :count).by(1)
      end

      it "redirects to the created ram" do
        post rams_path, params: { ram: attributes_for(:ram) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Ram" do
          expect {
            post rams_path, params: { ram: attributes_for(:invalid_ram) }
          }.to change(Ram, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post rams_path, params: { ram: attributes_for(:invalid_ram) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:ram) { create(:ram) }

      it "updates the requested ram" do
        ram = create(:ram)
        patch ram_path(ram), params: { ram: attributes_for(:ram) }
      end

      it "redirects to the ram" do
        ram = create(:ram)
        patch ram_path(ram), params: { ram: attributes_for(:ram) }
        expect(response).to redirect_to(ram_path(ram))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ram" do
      ram = create(:ram)
      expect {
        delete ram_path(ram)
      }.to change(Ram, :count).by(-1)
    end

    it "redirects to the rams list" do
      ram = create(:ram)
      delete ram_path(ram)
      expect(response).to redirect_to(root_path)
    end
  end
end
