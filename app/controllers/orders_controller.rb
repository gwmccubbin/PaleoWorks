class OrdersController < ApplicationController
  load_and_authorize_resource
  before_filter :load_order_items, only: :index

  def index
    respond_with @orders
  end

  def new
  end

  def create
    @order = Order.new order_params
    @order.save
    respond_with @order
  end

  def show
    respond_with @order
  end

  def edit
  end

  def update
    @order.update(order_params)
    respond_with @order
  end

  def destroy
    @order.destroy
    respond_with @order
  end

  private

  def load_order_items
    @orders = @orders.includes(:order_items)
  end

  def order_params
    # TODO: Restrict to correct params
    params.require(:order).permit!
  end
end
