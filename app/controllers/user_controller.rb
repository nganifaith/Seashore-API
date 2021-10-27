class UserController < ApplicationController
  before_action :authenticate_user, except: [:create]

  def index
    render json: current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      knock_token = Knock::AuthToken.new payload: { sub: @user.id }
      render json: { jwt: knock_token.token }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
