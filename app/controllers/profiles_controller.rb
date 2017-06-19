class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user?
  before_action :set_profile, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_path(@profile.user_id)
    else
      flash[:alert] = @profile.errors.full_messages.join(", ")
      redirect_to edit_profile_path(@profile)
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(
      :id,
      :l_city,
      :l_state,
      :l_country,
      :dancer,
      :caller,
      :musician,
      :band,
      :choreographer,
      :composer,
      :about,
      :privacy_fn,
      :privacy_ln,
      :privacy_ce,
      :privacy_lcity,
      :privacy_lstate,
      :privacy_lcountry
    )
  end
end
