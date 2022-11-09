class ProcessorsController < ApplicationController
  before_action :set_processor, only: %i[ show edit update destroy ]

  def index
    @processors = Processor.all.order("created_at DESC")
  end

  def show
  end

  def new
    @processor = Processor.new
  end

  def edit
  end

  def create
    @processor = Processor.new(processor_params)

    if @processor.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @processor.update(processor_params)
      redirect_to processor_path(@processor)
    else
      render 'new'
    end
  end

  def destroy
    @processor.destroy
    redirect_to root_path
  end

  private

  def processor_params
    params.require(:processor).permit(:name, :number_cores, :operating_system, :clock_frequency)
  end

  def set_processor
    @processor = Processor.find(params[:id])
  end
end
