class ItemsController < ApplicationController
  def index
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

    if @item.save
      flash[:success] = 'Item successfully added.'
    else
      flash[:error] = 'Item cannot be saved.'
    end

    respond_with @item, location: path
  end

  def edit
  end
  
  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :cost, :price, :item_type_id)
  end
end
