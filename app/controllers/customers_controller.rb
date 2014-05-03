class CustomersController < ApplicationController
  load_and_authorize_resource except: [:index]

  def index
    @customers = Customer.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @customer =  Customer.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
