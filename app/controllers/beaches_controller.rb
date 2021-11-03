class BeachesController < ApplicationController
  before_action :set_beach, only: %i[show update destroy]

  # GET /beaches
  def index
    @beaches = Beach.by_name(beach_filter_params['searchTerm'])
    @beaches = @beaches.with_favorite(current_user.id) if current_user && beach_filter_params['favourites'] == 'true'

    render json: @beaches, each_serializer: BeachSerializer
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

  def beach_filter_params
    params.permit(:searchTerm, :favourites)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_beach
    @beach = Beach.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def beach_params
    params.require(:beach)
      .permit(:name, :country, :city, :address, :rating, :featured_image, :details, :email, :phone_number, :website)
  end
end
