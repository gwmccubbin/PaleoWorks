class OrdersController < ApplicationController
  load_and_authorize_resource except: [:index]

  def index
    @orders = Order.includes(:order_items)
    if params[:type] == 'current'
      @orders = @orders.current
    elsif params[:type] == 'past'
      @orders = @orders.past
    end

    if customer_id = params[:customer_id]
      @orders = @orders.where(customer_id: customer_id)
    end

    @orders = @orders.paginate(:page => params[:page], :per_page => 10)
    respond_with @orders    
  end

  def new
  end

  def create
    @order = Order.new order_params

    path = if params[:commit] == 'Add Order'
             orders_path
           elsif params[:commit] == 'Save & Add New'
             new_order_path
           else
             orders_path
           end

    @order.save
    respond_with @order, location: path
  end

  def show
    respond_with @order
  end

  def edit
  end

  def update
    path = if params[:commit] == 'Save & Continue'
             edit_order_path @order
           elsif params[:commit] == 'Update order'
             order_path @order
           end

    @order.update(order_params)
    respond_with @order, location: path
  end

  def destroy
    @order.destroy
    respond_with @order
  end

  private

  def order_params
    # TODO: Restrict to correct params
    params.require(:order).permit!
  end
end
