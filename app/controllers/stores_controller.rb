class StoresController < ApplicationController
  before_action :authenticate_user! 

  def index
    @pagy, @stores = pagy(Store.all)
  end

  def show
    @store = Store.find(params[:id])
    @pagy, @store_items = pagy(StoreItem.filter_by_store_id(params[:id]))
  end
  
  def new
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
