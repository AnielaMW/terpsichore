class Api::DanceDirectionsController < ApplicationController
  # not the best solution, leaves the code open to attack. Use for now, but find a better solution.
  # looks like CSRF token is problem.
  skip_before_action :verify_authenticity_token
  
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
      :movement,
      :position
    )
  end
end
