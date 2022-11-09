class LaptopsController < ApplicationController
  before_action :set_laptop, only: %i[ show edit update destroy ]

  def index
    @laptops = Laptop.all.order("created_at DESC")
  end

  def show
  end

  def new
    @laptop = Laptop.new
  end

  def edit
  end

  def create
    @laptop = Laptop.new(laptop_params)

    if @laptop.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @laptop.update(laptop_params)
      redirect_to laptop_path(@laptop)
    else
      render 'new'
    end
  end

  def destroy
    @laptop.destroy
    redirect_to root_path
  end

  private

  def laptop_params
    params.require(:laptop).permit(:full_name, :price, :description, :brand, :op, :type_laptop)
  end

  def set_laptop
    @laptop = Laptop.find(params[:id])
  end
end
