class Api::DancesController < ApplicationController
  def create
    @dance = Dance.new(dance_params)
    binding.pry
    @dance.save
    binding.pry

    dance = [
      @dance,
      user: @dance.user.user_name,
      formation: @dance.formation.name,
      meter: @dance.meter.name
    ]

    render json: dance
  end

  def update
    @dance = Dance.find(dance_params[:id])
    @dance.update(dance_params)

    dance = [
      @dance,
      user: @dance.user.user_name,
      formation: @dance.formation.name,
      meter: @dance.meter.name
    ]

    render json: dance
  end

  private

  def dance_params
    params.require(:dance).permit(
      :id,
      :title,
      :choreographer,
      :publication,
      :year,
      :formation_id,
      :user_id,
      :meter_id
    )
  end
end
