class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard
    @customer = Customer.new  
  end
end
