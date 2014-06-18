class OrderItemsController < ApplicationController
  load_and_authorize_resource :order
  load_and_authorize_resource through: :order

  def index
    respond_with @order_items
  end

  def show
    respond_with @order_item
  end

  def new

  end

  def create
    @order_item.save
    respond_with @order_item
  end

  def edit

  end

  def update
    @order_item.update(order_item_params)
    respond_with @order_item
  end

  def destroy
    @order_item.destroy
    respond_with @order_item
  end

  private

  def order_item_params
    # TODO: Restrict to correct params
    params.require(:order_item).permit!
  end
end