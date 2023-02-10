class BatteriesController < ApplicationController
  before_action :set_battery, only: %i[ show edit update destroy ]

  def index
    @batteries = Battery.all.order("created_at DESC")
  end

  def show
  end

  def new
    @battery = Battery.new
  end

  def edit
  end

  def create
    @battery = Battery.new(battery_params)

    if @battery.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @battery.update(battery_params)
      redirect_to battery_path(@battery)
    else
      render 'new'
    end
  end

  def destroy
    @battery.destroy
    redirect_to root_path
  end

  private

  def battery_params
    params.require(:battery).permit(:battery_capacity, :battery_life)
  end

  def set_battery
    @battery = Battery.find(params[:id])
  end
end
