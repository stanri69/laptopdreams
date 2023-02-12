require 'rails_helper'

RSpec.describe "/processors", type: :request do

  let(:processor) { create(:processor) }

  describe "GET /index" do
    it "renders a successful response" do
      get processors_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      processor = create(:processor)
      get processor_path(processor)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_processor_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      processor = create(:processor)
      get edit_processor_path(processor)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Processor" do
        expect {
          post processors_path, params: { processor: attributes_for(:processor) }
        }.to change(Processor, :count).by(1)
      end

      it "redirects to the created processor" do
        post processors_path, params: { processor: attributes_for(:processor) }
        expect(response).to redirect_to(root_path)
      end

      context "with invalid parameters" do
        it "does not create a new Processor" do
          expect {
            post processors_path, params: { processor: attributes_for(:invalid_processor) }
          }.to change(Processor, :count).by(0)
        end


        it "renders a response with 422 status (i.e. to display the 'new' template)" do
          post processors_path, params: { processor: attributes_for(:invalid_processor) }
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:processor) { create(:processor) }

      it "updates the requested processor" do
        processor = create(:processor)
        patch processor_path(processor), params: { processor: attributes_for(:processor) }
      end

      it "redirects to the processor" do
        processor = create(:processor)
        patch processor_path(processor), params: { processor: attributes_for(:processor) }
        expect(response).to redirect_to(processor_path(processor))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested processor" do
      processor = create(:processor)
      expect {
        delete processor_path(processor)
      }.to change(Processor, :count).by(-1)
    end

    it "redirects to the processors list" do
      processor = create(:processor)
      delete processor_path(processor)
      expect(response).to redirect_to(root_path)
    end
  end
end
