require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) { create(:user) }

  describe "#new" do
    it "assigns a new User to user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "#edit" do
    it "assigns the requested user to user" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(response).to render_template :edit
    end

    it "renders the :edit template" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
          post :create, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid attributes" do
      it "does not save the new user in the database" do
        expect{
          post :create, params: { user: attributes_for(:invalid_user) }
        }.not_to change(User, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { user: attributes_for(:invalid_user) }
        expect(response).to render_template :new
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested user" do
        patch :update, params: { id: user, brand: attributes_for(:user) }
        expect(assigns(:user)).to eq user
      end

      it "changes users attributes" do
        patch :update, params: { id: user, user: attributes_for(:user, email: user.email) }
        user.reload
        expect(user.email).to eq(user.email)
      end

      it "redirects to the user" do
        patch :update, params: { id: user, user: attributes_for(:user) }
        expect(response).to redirect_to user
      end
    end

    context "with invalid attributes" do
      it "does not update the user in the database" do
        patch :update, params: { id: user, user: attributes_for(:invalid_user, email: 'user@gmail.com', password: 123123) }
        expect(user.email).not_to eq('test')
      end

      it "re-renders the :edit template" do
        patch :update, params: { id: user, user: attributes_for(:invalid_user) }
        expect(assigns(:user)).to eq user
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "#destroy" do
    it "deletes the user from the database" do
      user = create(:user)
      expect{
        delete :destroy, params: { id: user }
      }.to change(User, :count).by(-1)
    end

    it "redirects to laptops#index" do
      delete :destroy, params: { id: user }
      expect(response).to redirect_to root_path
    end
  end
end