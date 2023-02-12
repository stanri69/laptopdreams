class FavoritesController < ApplicationController
  before_action :find_laptop
  before_action :find_favorite, only: [:destroy]

  def create
    if already_favorite?
      flash[:notice] = "You cant favorite more than once."
    else
      @laptop.favorites.create(user_id: current_user.id)
    end
    redirect_to laptops_path(@laptop)
  end

  def destroy
    if ! (already_favorite?)
      flash[:notice] = "Cannot unfavorite"
    else
      @favorite.destroy
    end
    redirect_to laptops_path(@laptop)
  end

  private

  def find_favorite
    @favorite = @laptop.favorites.find(params[:id])
  end

  def find_laptop
    @laptop = Laptop.find(params[:laptop_id])
  end

  def already_favorite?
    Favorite.where(user_id: current_user.id, laptop_id: params[:laptop_id]).exists?
  end
end
