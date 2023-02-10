class AdditionalliesController < ApplicationController
  before_action :set_additionally, only: %i[ show edit update destroy ]

  # GET /additionallies or /additionallies.json
  def index
    @additionallies = Additionally.all
  end

  # GET /additionallies/1 or /additionallies/1.json
  def show
  end

  # GET /additionallies/new
  def new
    @additionally = Additionally.new
  end

  # GET /additionallies/1/edit
  def edit
  end

  # POST /additionallies or /additionallies.json
  def create
    @additionally = Additionally.new(additionally_params)

    respond_to do |format|
      if @additionally.save
        format.html { redirect_to additionally_url(@additionally), notice: "Additionally was successfully created." }
        format.json { render :show, status: :created, location: @additionally }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @additionally.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additionallies/1 or /additionallies/1.json
  def update
    respond_to do |format|
      if @additionally.update(additionally_params)
        format.html { redirect_to additionally_url(@additionally), notice: "Additionally was successfully updated." }
        format.json { render :show, status: :ok, location: @additionally }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @additionally.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additionallies/1 or /additionallies/1.json
  def destroy
    @additionally.destroy

    respond_to do |format|
      format.html { redirect_to additionallies_url, notice: "Additionally was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additionally
      @additionally = Additionally.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def additionally_params
      params.require(:additionally).permit(:additionally_features, :producing_country, :supply_set, :registration, :guarantee)
    end
end
