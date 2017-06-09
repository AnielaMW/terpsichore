class DanceDirectionsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :admin_user?, only: [:show]
  before_action :set_dance_direction, only: [:show]

  def show
  end

  private

  def set_dance_direction
    @dance_direction ||= DanceDirection.find(params[:id])
  end

  def dance_direction_params
    params.require(:dance_direction).permit(
      :dance_id,
      :sequence,
      :mark,
      :measure,
      :direction,
      :position
    )
  end
end
