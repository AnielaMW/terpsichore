class MetersController < ApplicationController
  before_action :admin_user?
  before_action :set_meter, only: [:show, :edit, :update, :destroy]

  def index
    @meters = meters
  end

  def show
  end

  def new
    @meter = Meter.new
  end

  def create
    @meter = Meter.new(meter_params)
    if @meter.save
      redirect_to new_dance_path
    else
      flash[:alert] = @meter.errors.full_messages.join(", ")
      render new_meter_path
    end
  end

  def edit
  end

  def update
    if @meter.update(meter_params)
      redirect_to meter_path(@meter)
    else
      flash[:alert] = @meter.errors.full_messages.join(", ")
      redirect_to edit_meter_path(@meter)
    end
  end

  def destroy
    if @admin_user
      @meter.destroy
      redirect_to meters_path
    else
      redirect_to meter_path(@meter)
    end
  end

  private

  def meters
    Meter.all.order(:name)
  end

  def set_meter
    @meter = Meter.find(params[:id])
  end

  def meter_params
    params.require(:meter).permit(
      :name,
      :description
    )
  end
end
