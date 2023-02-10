class VideocardsController < ApplicationController
  before_action :set_videocard, only: %i[ show edit update destroy ]

  def index
    @videocards = Videocard.all.order("created_at DESC")
  end

  def show
  end

  def new
    @videocard = Videocard.new
  end

  def edit
  end

  def create
    @videocard = Videocard.new(videocard_params)

    if @videocard.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @videocard.update(videocard_params)
      redirect_to videocard_path(@videocard)
    else
      render 'new'
    end
  end

  def destroy
    @videocard.destroy
    redirect_to root_path
  end

  private

  def videocard_params
    params.require(:videocard).permit(:type_videocard, :name, :amount_memory, :description)
  end

  def set_videocard
    @videocard = Videocard.find(params[:id])
  end
end
