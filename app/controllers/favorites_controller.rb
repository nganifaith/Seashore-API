class FavoritesController < ApplicationController
  before_action :authenticate_user

  def create
    render json: Favorite.create(beach_id: favorite_params['beach_id'], user_id: current_user.id)
  end

  def destroy
    render json: Favorite.where(beach_id: favorite_params['beach_id'], user_id: current_user.id).destroy_all
  end

  private
  
  def favorite_params
    params.permit(:beach_id)
  end
end
