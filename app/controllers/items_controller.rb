class ItemsController < ApplicationController
  def index
    @pagy, @items = pagy(Item.all)
  end

  def show
    @item = Item.find(params[:id])
    @pagy, @store_items = pagy(StoreItem.filter_by_item_id(params[:id]))
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.save
      redirect_to @item
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path, status: :see_other 
  end

  private
    def item_params
      params.require(:item).permit(:item_name)
    end
end
