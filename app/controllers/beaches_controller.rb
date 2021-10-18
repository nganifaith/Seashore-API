class BeachesController < ApplicationController
  before_action :set_beach, only: %i[show update destroy]

  # GET /beaches
  def index
    @beaches = Beach.where('name LIKE :term or country LIKE :term', { term: "%#{beach_filter_params['searchTerm']}%" })
    if current_user && beach_filter_params['favourites'] == 'true'
      @beaches = @beaches.includes(:favorite).where('favorites.user_id = ?', current_user.id).references(:favorite)
    end

    render json: @beaches.to_json(include: { favorite: { only: :user_id } })
  end

  def beach_filter_params
    params.permit(:searchTerm, :favourites)
  end

  # GET /beaches/1
  def show
    render json: @beach
  end

  # POST /beaches
  def create
    @beach = Beach.new(beach_params)

    if @beach.save
      render json: @beach, status: :created, location: @beach
    else
      render json: @beach.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /beaches/1
  def update
    if @beach.update(beach_params)
      render json: @beach
    else
      render json: @beach.errors, status: :unprocessable_entity
    end
  end

  # DELETE /beaches/1
  def destroy
    @beach.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_beach
    @beach = Beach.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def beach_params
    params.require(:beach).permit(:name, :country, :city, :address, :rating, :image, :details)
  end
end
