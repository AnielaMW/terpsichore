class Api::DanceDirectionsController < ApplicationController
  def create
    @dance_direction = DanceDirection.new(dance_direction_params)
    @dance_direction.save

    render json: @dance_direction
  end

  def update
    @dance_direction = DanceDirection.find(dance_direction_params[:id])
    @dance_direction.update(dance_direction_params)

    render json: @dance_direction
  end

  private

  def dance_direction_params
    params.require(:dd).permit(
      :id,
      :dance_id,
      :sequence,
      :mark,
      :measure,
      :direction,
      :position
    )
  end
end
