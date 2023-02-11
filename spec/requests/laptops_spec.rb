require 'rails_helper'

RSpec.describe "/laptops", type: :request do

  let(:laptop) { create(:laptop) }
  let(:seller) { create(:seller) }


  describe "GET /index" do
    it "renders a successful response" do
      get laptops_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      laptop = create(:laptop)
      get laptop_path(laptop)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_laptop_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      laptop = create(:laptop)
      get edit_laptop_path(laptop)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Laptop" do
        expect {
          post laptops_path, params: { laptop: attributes_for(:laptop) }
        }.to change(Laptop, :count).by(1)
      end

      it "redirects to the created laptop" do
        post laptops_path, params: { laptop: attributes_for(:laptop) }
        expect(response).to redirect_to(laptop_path(Laptop.last))
      end

      context "with invalid parameters" do
        it "does not create a new Laptop" do
          expect {
            post laptops_path, params: { laptop: attributes_for(:invalid_laptop) }
          }.to change(Laptop, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post laptops_path, params: { laptop: attributes_for(:invalid_laptop) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:laptop) { create(:laptop) }

      it "updates the requested laptop" do
        laptop = create(:laptop)
        patch laptop_path(laptop), params: { laptop: attributes_for(:laptop) }
      end

      it "redirects to the laptop" do
        laptop = create(:laptop)
        patch laptop_path(laptop), params: { laptop: attributes_for(:laptop) }
        expect(response).to redirect_to(laptop_path(laptop))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        laptop = create(:laptop)
        patch laptop_path(laptop), params: { laptop: attributes_for(:invalid_laptop) }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested laptop" do
      laptop = create(:laptop)
      expect {
        delete laptop_path(laptop)
      }.to change(Laptop, :count).by(-1)
    end

    it "redirects to the laptops list" do
      laptop = create(:laptop)
      delete laptop_path(laptop)
      expect(response).to redirect_to(laptops_path)
    end
  end
end
