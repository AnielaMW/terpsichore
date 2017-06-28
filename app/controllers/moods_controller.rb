class MoodsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_user?
  before_action :set_mood, only: [:show, :edit, :update, :destroy]

  def index
    @moods = moods
  end

  def show
  end

  def new
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    if @mood.save
      redirect_to new_dance_path
    else
      flash[:alert] = @mood.errors.full_messages.join(", ")
      render new_mood_path
    end
  end

  def edit
  end

  def update
    if @mood.update(mood_params)
      redirect_to mood_path(@mood)
    else
      flash[:alert] = @mood.errors.full_messages.join(", ")
      redirect_to edit_mood_path(@mood)
    end
  end

  def destroy
    if @admin_user
      @mood.destroy
      redirect_to moods_path
    else
      redirect_to mood_path(@mood)
    end
  end

  private

  def moods
    Mood.all.order(:name)
  end

  def set_mood
    @mood = Mood.find(params[:id])
  end

  def mood_params
    params.require(:mood).permit(
      :name
    )
  end
end
