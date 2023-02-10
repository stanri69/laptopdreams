class CorpsController < ApplicationController
  before_action :set_corp, only: %i[ show edit update destroy ]

  # GET /corps or /corps.json
  def index
    @corps = Corp.all
  end

  # GET /corps/1 or /corps/1.json
  def show
  end

  # GET /corps/new
  def new
    @corp = Corp.new
  end

  # GET /corps/1/edit
  def edit
  end

  # POST /corps or /corps.json
  def create
    @corp = Corp.new(corp_params)

    respond_to do |format|
      if @corp.save
        format.html { redirect_to corp_url(@corp), notice: "Corp was successfully created." }
        format.json { render :show, status: :created, location: @corp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @corp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /corps/1 or /corps/1.json
  def update
    respond_to do |format|
      if @corp.update(corp_params)
        format.html { redirect_to corp_url(@corp), notice: "Corp was successfully updated." }
        format.json { render :show, status: :ok, location: @corp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @corp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corps/1 or /corps/1.json
  def destroy
    @corp.destroy

    respond_to do |format|
      format.html { redirect_to corps_url, notice: "Corp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_corp
      @corp = Corp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def corp_params
      params.require(:corp).permit(:color, :weight, :sound_system, :manipulators, :dimensions, :body_material)
    end
end
