class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def show
    @laptop = Laptop.find(params[:id])
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome user to the Laptop dreams!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
