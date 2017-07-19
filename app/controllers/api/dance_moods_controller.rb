class Api::DanceMoodsController < ApplicationController
  # not the best solution, leaves the code open to attack. Use for now, but find a better solution.
  # looks like CSRF token is problem.
  skip_before_action :verify_authenticity_token

  def create
    @dance_mood = DanceMood.new(dance_mood_params)
    @dance_mood.save

    render json: @dance_mood
  end

  private

  def dance_mood_params
    params.require(:dm).permit(
      :id,
      :dance_id,
      :mood_id
    )
  end
end
