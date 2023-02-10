class CorpsController < ApplicationController
  before_action :set_corp, only: %i[ show edit update destroy ]

  def index
    @corps = Corp.all.order("created_at DESC")
  end

  def show
  end

  def new
    @corp = Corp.new
  end

  def edit
  end

  def create
    @corp = Corp.new(corp_params)

    if @corp.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @corp.update(corp_params)
      redirect_to corp_path(@corp)
    else
      render 'new'
    end
  end

  def destroy
    @corp.destroy
    redirect_to root_path
  end

  private

  def corp_params
    params.require(:corp).permit(:color, :weight, :sound_system, :manipulators, :dimensions, :body_material)
  end

  def set_corp
    @corp = Corp.find(params[:id])
  end
end
