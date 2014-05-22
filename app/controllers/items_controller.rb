class ItemsController < ApplicationController  
  load_and_authorize_resource only: [:new, :show, :edit]
  responders :flash

  def index
    @items = Item.paginate :page => params[:page], :per_page => 10
  end

  def new
  end

  def create
    @item = Item.new item_params

    path = if params[:commit] == 'Save & Add New'
             new_item_path
           elsif params[:commit] == 'Add Item'
             items_path
           end

    @item.save
    respond_with @item, location: path
  end

  def show
  end

  def edit
  end
  
  def update
    @item = Item.find params[:id]
    @item.update_attributes item_params
    respond_with @item, location: @item
  end

  def destroy
    @item = Item.find params[:id]
    @item.destroy
    respond_with @item, location: items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :cost, :price, :item_type_id)
  end
end
