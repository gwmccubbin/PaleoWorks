class CustomersController < ApplicationController
  load_and_authorize_resource except: [:index]

  def index
    @customers = Customer.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @customer.addresses.build
    @customer.build_standard_order
  end

  def create
    @customer = Customer.new customer_params  

    path = if params[:commit] == 'Save & Add New'
             new_customer_path
           elsif params[:commit] == 'Add customer'
             customers_path
           end

    @customer.save
    respond_with @customer, path: path
  end

  def show
    @address = @customer.address
    @standard_order = @customer.standard_order
  end

  def edit
    @customer.addresses.build unless @customer.addresses.any?
    @customer.build_standard_order unless @customer.standard_order.present?
  end
  
  def update
    @customer.update_attributes customer_params

    path = if params[:commit] == 'Save & Continue'
             edit_customer_path @customer
           elsif params[:commit] == 'Update customer'
             customer_path @customer
           end

    @customer.save
    respond_with @customer, location: path
  end

  def destroy
    @customer.destroy
    respond_with @customer, location: customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :first_name, :last_name, :phone, :email, :customer_id, :active, :delivery, :notes, :location_id,
                                     addresses_attributes: [:address1, :address2, :zip],
                                     standard_order_attributes: [:breakfast_qty, :lunch_qty, :dinner_qty, :special_qty, :notes, :recurring])
  end
end
