class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :users, only: [:index]
  before_action :set_user, only: [:show]

  def index
  end

  def show
    # @dances = list_dances
    # @dance_comments = list_dcomments
  end

  private

  def users
    @users ||= User.all.order(:user_name)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def list_dances
    # @user.dances.order(:title)
  end

  def list_dcomments
    # @user.dance_comments.order(created_at: :desc)
  end
end
