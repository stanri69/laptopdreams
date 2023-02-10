class LaptopsController < ApplicationController
  before_action :set_laptop, only: %i[ show edit update destroy ]
  before_action :set_characteristics

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

  def set_laptop
    @laptop = Laptop.find(params[:id])
  end

  def laptop_params
    params.require(:laptop).permit(:full_name, :price, :description, :brand, :op, :type_laptop, :image,
                                   :battery_id, :ram_id, :processor_id, :datalogger_id, :connection_id, :additionally_id,
                                   :corp_id, :screen_id, :videocard_id)
  end

  def set_characteristics
    @additionallies = Additionally.all.order(:additionally_features)
    @batteries = Battery.all.order(:battery_capacity)
    @connections = Connection.all.order(:ports)
    @corps = Corp.all.order(:color)
    @dataloggers = Datalogger.all.order(:type_datalogger)
    @processors = Processor.all.order(:name)
    @rams = Ram.all.order(:type_ram)
    @screens = Screen.all.order(:diagonal)
    @videocards = Videocard.all.order(:type_videocard)
  end
end
