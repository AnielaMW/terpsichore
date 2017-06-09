class KeysController < ApplicationController
  before_action :admin_user?
  before_action :set_key, only: [:show, :edit, :update, :destroy]

  def index
    @keys = keys
  end

  def show
  end

  def new
    @key = Key.new
  end

  def create
    @key = Key.new(key_params)
    if @key.save
      redirect_to new_dance_path
    else
      flash[:alert] = @key.errors.full_messages.join(", ")
      render new_key_path
    end
  end

  def edit
  end

  def update
    if @key.update(key_params)
      redirect_to key_path(@key)
    else
      flash[:alert] = @key.errors.full_messages.join(", ")
      redirect_to edit_key_path(@key)
    end
  end

  def destroy
    if @admin_user
      @key.destroy
      redirect_to keys_path
    else
      redirect_to key_path(@key)
    end
  end

  private

  def keys
    Key.all.order(:name)
  end

  def set_key
    @key = Key.find(params[:id])
  end

  def key_params
    params.require(:key).permit(
      :name
    )
  end
end
