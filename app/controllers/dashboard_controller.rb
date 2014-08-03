class DashboardController < ApplicationController
  before_action :authenticate_user!
  def show
    @customer = Customer.new
    @customer.addresses.build
    @customer.build_standard_order
  end

end
