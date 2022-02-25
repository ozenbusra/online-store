class ItemsController < ApplicationController
  before_action :authenticate_user! 
  
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
    authorize Item
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
    authorize Item
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize Item
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path, status: :see_other 
  end

  private
    def item_params
      params.require(:item).permit(:item_name)
    end
end
