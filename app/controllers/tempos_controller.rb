class TemposController < ApplicationController
  before_action :admin_user?
  before_action :set_tempo, only: [:show, :edit, :update, :destroy]

  def index
    @tempos = tempos
  end

  def show
  end

  def new
    @tempo = Tempo.new
  end

  def create
    @tempo = Tempo.new(tempo_params)
    if @tempo.save
      redirect_to new_dance_path
    else
      flash[:alert] = @tempo.errors.full_messages.join(", ")
      render new_tempo_path
    end
  end

  def edit
  end

  def update
    if @tempo.update(tempo_params)
      redirect_to tempo_path(@tempo)
    else
      flash[:alert] = @tempo.errors.full_messages.join(", ")
      redirect_to edit_tempo_path(@tempo)
    end
  end

  def destroy
    if @admin_user
      @tempo.destroy
      redirect_to tempos_path
    else
      redirect_to tempo_path(@tempo)
    end
  end

  private

  def tempos
    Tempo.all
  end

  def set_tempo
    @tempo = Tempo.find(params[:id])
  end

  def tempo_params
    params.require(:tempo).permit(
      :name,
      :description
    )
  end
end
