class FavoritesController < ApplicationController
  before_action :authenticate_user! 

  def index
    authorize Favorite
    @pagy, @favorites = pagy(Favorite.all)
  end
end
