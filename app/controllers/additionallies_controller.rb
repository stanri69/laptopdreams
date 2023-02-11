class AdditionalliesController < ApplicationController
  before_action :set_additionally, only: %i[ show edit update destroy ]

  def index
    @additionallies = Additionally.all
  end

  def show
  end

  def new
    @additionally = Additionally.new
  end

  def edit
  end

  def create
    @additionally = Additionally.new(additionally_params)

    if @additionally.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @additionally.update(additionally_params)
      redirect_to additionally_path(@additionally)
    else
      render 'new'
    end
  end

  def destroy
    @additionally.destroy
    redirect_to root_path
  end

  private

  def additionally_params
    params.require(:additionally).permit(:additionally_features, :producing_country, :supply_set, :registration, :guarantee)
  end

  def set_additionally
    @additionally = Additionally.find(params[:id])
  end
end
