class ScreensController < ApplicationController
  before_action :set_screen, only: %i[ show edit update destroy ]

  def index
    @screens = Screen.all.order("created_at DESC")
  end

  def show
  end

  def new
    @screen = Screen.new
  end

  def edit
  end

  def create
    @screen = Screen.new(screen_params)

    if @screen.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @screen.update(screen_params)
      redirect_to screen_path(@screen)
    else
      render 'new'
    end
  end

  def destroy
    @screen.destroy
    redirect_to root_path
  end

  private

  def screen_params
    params.require(:screen).permit(:diagonal, :screen_type, :resolution, :refresh_rate, :built_camera)
  end

  def set_screen
    @screen = Screen.find(params[:id])
  end
end
