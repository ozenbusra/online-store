class FavoritesController < ApplicationController
  before_action :authenticate_user! 

  def index
    authorize Favorite
    @pagy, @favorites = pagy(Favorite.filter_by_user_id(current_user.id))
  end
end
