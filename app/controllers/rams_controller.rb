class RamsController < ApplicationController
  before_action :set_ram, only: %i[ show edit update destroy ]

  def index
    @rams = Ram.all.order("created_at DESC")
  end

  def show
  end

  def new
    @ram = Ram.new
  end

  def edit
  end

  def create
    @ram = Ram.new(ram_params)

    if @ram.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @ram.update(ram_params)
      redirect_to ram_path(@ram)
    else
      render 'new'
    end
  end

  def destroy
    @ram.destroy
    redirect_to root_path
  end

  private

  def ram_params
    params.require(:ram).permit(:amount, :number_slot, :type_ram)
  end

  def set_ram
    @ram = Ram.find(params[:id])
  end
end
