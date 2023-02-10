class ConnectionsController < ApplicationController
  before_action :set_connection, only: %i[ show edit update destroy ]

  def index
    @connections = Connection.all.order("created_at DESC")
  end

  def show
  end

  def new
    @connection = Connection.new
  end

  def edit
  end

  def create
    @connection = Connection.new(connection_params)

    if @connection.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @connection.update(connection_params)
      redirect_to connection_path(@connection)
    else
      render 'new'
    end
  end

  def destroy
    @connection.destroy
    redirect_to root_path
  end

  private

  def connection_params
    params.require(:connection).permit(:network_adapters, :ports, :wireless_communication)
  end

  def set_connection
    @connection = Connection.find(params[:id])
  end
end
