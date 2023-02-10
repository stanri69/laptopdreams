class SellersController < ApplicationController
  before_action :authenticate_seller!

  def new
    @seller = Seller.new
  end

  def create
    @seller = Seller.new(seller_params)

    if @seller.save
      flash[:success] = "Welcome seller to the Laptop dreams!"
      redirect_to @seller
    else
      render 'new'
    end
  end

  def destroy
    @seller.destroy
    redirect_to root_path
  end

  private

  def seller_params
    params.require(:seller).permit(:email, :password, :password_confirmation)
  end
end

