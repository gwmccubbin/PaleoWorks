class CustomersController < ApplicationController
  load_and_authorize_resource except: [:index]
  before_filter :build_associations, only: [:new, :edit]

  def index
    @customers = Customer.paginate(:page => params[:page], :per_page => 10)
  end

  def new

  end

  def create
    @customer = Customer.new customer_params  

    path = if params[:commit] == 'Save Customer'
             root_path
           elsif params[:commit] == 'Save & Add New'
             new_customer_path
           elsif params[:commit] == 'Add customer'
             customers_path
           end

    unless @customer.save
      build_associations
    end

    respond_with @customer, location: path
  end

  def show
    @address = @customer.address
    @standard_order = @customer.standard_order
  end

  def edit

  end
  
  def update
    @customer.update_attributes customer_params

    path = if params[:commit] == 'Save & Continue'
             edit_customer_path @customer
           elsif params[:commit] == 'Update customer'
             customer_path @customer
           end

    unless @customer.save
      build_associations
    end

    respond_with @customer, location: path
  end

  def destroy
    @customer.destroy
    respond_with @customer, location: customers_path
  end

  private

  def build_associations
    @address = @customer.address || @customer.addresses.build
    @standard_order = @customer.standard_order || @customer.build_standard_order
  end

  def customer_params
    params.require(:customer).permit(:id, :first_name, :last_name, :phone, :email, :customer_id, :active, :delivery, :notes, :location_id,
                                     addresses_attributes: [:address1, :address2, :zip],
                                     standard_order_attributes: [:breakfast_qty, :lunch_qty, :dinner_qty, :special_qty, :notes, :recurring])
  end
end
