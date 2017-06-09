class DanceLevelsController < ApplicationController
  before_action :admin_user?
  before_action :set_dance_level, only: [:show, :edit, :update, :destroy]

  def index
    @dance_levels = dance_levels
  end

  def show
  end

  def new
    @dance_level = DanceLevel.new
  end

  def create
    @dance_level = DanceLevel.new(dance_level_params)
    if @dance_level.save
      redirect_to new_dance_path
    else
      flash[:alert] = @dance_level.errors.full_messages.join(", ")
      render new_dance_level_path
    end
  end

  def edit
  end

  def update
    if @dance_level.update(dance_level_params)
      redirect_to dance_level_path(@dance_level)
    else
      flash[:alert] = @dance_level.errors.full_messages.join(", ")
      redirect_to edit_dance_level_path(@dance_level)
    end
  end

  def destroy
    if @admin_user
      @dance_level.destroy
      redirect_to dance_levels_path
    else
      redirect_to dance_level_path(@dance_level)
    end
  end

  private

  def dance_levels
    DanceLevel.all
  end

  def set_dance_level
    @dance_level = DanceLevel.find(params[:id])
  end

  def dance_level_params
    params.require(:dance_level).permit(
      :name,
      :description
    )
  end
end
