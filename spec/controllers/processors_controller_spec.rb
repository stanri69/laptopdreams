require 'rails_helper'

RSpec.describe ProcessorsController, :type => :controller do

  let(:processor) { create(:processor) }

  describe "#index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "assigns a new Processor to processor" do
      get :new
      expect(assigns(:processor)).to be_a_new(Processor)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested processor to processor" do
      processor = create(:processor)
      get :edit, params: { id: processor }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      processor = create(:processor)
      get :edit, params: { id: processor }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new processor in the database" do
        expect{
          post :create, params: { processor: attributes_for(:processor) }
        }.to change(Processor, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new processor in the database" do
        expect{
          post :create, params: { processor: attributes_for(:invalid_processor) }
        }.not_to change(Processor, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { processor: attributes_for(:invalid_processor) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested processor" do
        patch :update, params: { id: processor, processor: attributes_for(:processor) }
        expect(assigns(:processor)).to eq processor
      end

      it "changes processor attributes" do
        patch :update, params: { id: processor, processor: attributes_for(:processor, name: processor.name) }
        expect(processor.name).to eq(processor.name)
      end

      it "redirects to the processor" do
        patch :update, params: { id: processor, processor: attributes_for(:processor) }
        expect(response).to redirect_to processor
      end
    end

    context "with invalid attributes" do
      it "does not update the processor in the database" do
        patch :update, params: { id: processor, processor: attributes_for(:invalid_processor, name: "sa", number_cores: 1) }
        expect(processor.name).not_to eq('test')
      end
    end
  end

  describe "#destroy" do
    it "deletes the processor from the database" do
      processor = create(:processor)
      expect{
        delete :destroy, params: { id: processor }
      }.to change(Processor, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: processor }
      expect(response).to redirect_to root_path
    end
  end
end