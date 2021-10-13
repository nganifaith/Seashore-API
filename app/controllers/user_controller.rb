class UserController < ApplicationController
  before_action :authenticate_user,except: [:create]

  def index
    render json: current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
