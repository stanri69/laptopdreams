class DataloggersController < ApplicationController
  before_action :set_datalogger, only: %i[ show edit update destroy ]

  # GET /dataloggers or /dataloggers.json
  def index
    @dataloggers = Datalogger.all
  end

  # GET /dataloggers/1 or /dataloggers/1.json
  def show
  end

  # GET /dataloggers/new
  def new
    @datalogger = Datalogger.new
  end

  # GET /dataloggers/1/edit
  def edit
  end

  # POST /dataloggers or /dataloggers.json
  def create
    @datalogger = Datalogger.new(datalogger_params)

    respond_to do |format|
      if @datalogger.save
        format.html { redirect_to datalogger_url(@datalogger), notice: "Datalogger was successfully created." }
        format.json { render :show, status: :created, location: @datalogger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @datalogger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataloggers/1 or /dataloggers/1.json
  def update
    respond_to do |format|
      if @datalogger.update(datalogger_params)
        format.html { redirect_to datalogger_url(@datalogger), notice: "Datalogger was successfully updated." }
        format.json { render :show, status: :ok, location: @datalogger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @datalogger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataloggers/1 or /dataloggers/1.json
  def destroy
    @datalogger.destroy

    respond_to do |format|
      format.html { redirect_to dataloggers_url, notice: "Datalogger was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datalogger
      @datalogger = Datalogger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def datalogger_params
      params.require(:datalogger).permit(:volume, :type_datalogger)
    end
end
