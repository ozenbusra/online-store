class StoreItemsController < ApplicationController
  def index
    @pagy, @store_items = pagy(StoreItem.all)
  end
  
  def show
    @store_item = StoreItem.find(params[:id])
  end
  
  def new
    @store_item = StoreItem.new(item_id: params[:item_id], store_id: params[:store_id])
  end

  def create
    @store_item = StoreItem.new(store_item_params)
    
    if @store_item.save
      redirect_to store_items_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @store_item = StoreItem.find(params[:id])
  end

  def update
    @store_item = StoreItem.find(params[:id])

    if @store_item.update(store_item_params)
      redirect_to store_items_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @store_item = StoreItem.find(params[:id])
    @store_item.destroy

    redirect_to store_items_path, status: :see_other 
  end

  private
    def store_item_params
      params.require(:store_item).permit(:store_id, :item_id, :price, :stock_quantity)
    end
end
