class Api::FavoritesController < Api::BaseApiController
  before_action :authenticate_user! 

  def index
    authorize Favorite
    @pagy, @favorites = pagy(Favorite.all)
    render json: { "data": @favorites, "pager": page_serializer(@pagy) }
  end

  def show
    authorize Favorite
    @favorite = Favorite.find(params[:id])
    render json: @favorite
  end

  def new
    authorize Favorite
    @favorite = Favorite.new
  end

  def create
    authorize Favorite
    @favorite = Favorite.new(user: current_user, item_id: params[:item_id], store_id: params[:store_id])

    if @favorite.save
      render json: { message: "Added to favorites successfully" }, status: 201
    else
      render json: { error: "Couldn't add to favorites." }, status: 401
    end
  end

  def destroy
    authorize Favorite
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
        render json: { message: "Destroyed successfully" }, status: 201
    else 
        render json: { error: "Couldn't destroy." }, status: 401
    end
  end
end
