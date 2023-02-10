class RamsController < ApplicationController
  before_action :set_ram, only: %i[ show edit update destroy ]

  # GET /rams or /rams.json
  def index
    @rams = Ram.all
  end

  # GET /rams/1 or /rams/1.json
  def show
  end

  # GET /rams/new
  def new
    @ram = Ram.new
  end

  # GET /rams/1/edit
  def edit
  end

  # POST /rams or /rams.json
  def create
    @ram = Ram.new(ram_params)

    respond_to do |format|
      if @ram.save
        format.html { redirect_to ram_url(@ram), notice: "Ram was successfully created." }
        format.json { render :show, status: :created, location: @ram }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rams/1 or /rams/1.json
  def update
    respond_to do |format|
      if @ram.update(ram_params)
        format.html { redirect_to ram_url(@ram), notice: "Ram was successfully updated." }
        format.json { render :show, status: :ok, location: @ram }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rams/1 or /rams/1.json
  def destroy
    @ram.destroy

    respond_to do |format|
      format.html { redirect_to rams_url, notice: "Ram was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ram
      @ram = Ram.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ram_params
      params.require(:ram).permit(:amount, :number_slot, :type_ram)
    end
end
