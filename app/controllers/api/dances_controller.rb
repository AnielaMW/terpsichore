class Api::DancesController < ApplicationController
  def create
    @dance = Dance.new(dance_params)
    @dance.save

    render json: @dance
  end

  def update
    @dance = Dance.find(dance_params[:id])
    @dance.update(dance_params)

    render json: @dance
  end

  private

  def dance_params
    params.require(:dance).permit(
      :id,
      :title,
      :choreographer,
      :publication,
      :year,
      :dance_level_id,
      :formation_id,
      :key_id,
      :meter_id,
      :tempo_id,
      :user_id,
    )
  end
end
