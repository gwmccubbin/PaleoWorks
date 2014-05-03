class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @customer = Customer.new  
  end

end
