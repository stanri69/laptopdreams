class DataloggersController < ApplicationController
  before_action :set_datalogger, only: %i[ show edit update destroy ]

  def index
    @dataloggers = Datalogger.all.order("created_at DESC")
  end

  def show
  end

  def new
    @datalogger = Datalogger.new
  end

  def edit
  end

  def create
    @datalogger = Datalogger.new(datalogger_params)

    if @datalogger.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @datalogger.update(datalogger_params)
      redirect_to datalogger_path(@datalogger)
    else
      render 'new'
    end
  end

  def destroy
    @datalogger.destroy
    redirect_to root_path
  end

  private

  def datalogger_params
    params.require(:datalogger).permit(:volume, :type_datalogger)
  end

  def set_datalogger
    @datalogger = Datalogger.find(params[:id])
  end
end
