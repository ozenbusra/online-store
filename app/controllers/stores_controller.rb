class StoresController < ApplicationController
  before_action :authenticate_user! 

  def index
    authorize Store
    @pagy, @stores = pagy(Store.all)
    @favorites = Favorite.filter_by_user_id(current_user.id)
  end

  def show
    authorize Store
    @store = Store.find(params[:id])
    @pagy, @store_items = pagy(StoreItem.filter_by_store_id(params[:id]))
    @favorite = Favorite.filter_by_user_id(current_user.id).filter_by_store_id(@store.id)[0]
  end
  
  def new
    authorize Store
    @store = Store.new
  end

  def create
    authorize Store
    @store = Store.new(store_params)
    
    if @store.save
      redirect_to @store
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    authorize Store
    @store = Store.find(params[:id])
  end

  def update
    authorize Store
    @store = Store.find(params[:id])

    if @store.update(store_params)
      redirect_to @store
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize Store
    @store = Store.find(params[:id])
    @store.destroy

    redirect_to stores_path, status: :see_other 
  end

  private
    def store_params
      params.require(:store).permit(:store_name, :location_id)
    end
end
