class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :instantiate_customer_and_build_relationships, only: [:show]
  
  helper_method :active_customer_count, :inactive_customer_count, :customer_count
  helper_method :location_count, :custom_delivery_order_count, :gym_delivery_order_count

  def show
    @top_locations = Location.top(5)
    @recent_customers = Customer.recent(5)
    @current_menu = Menu.current.includes(:items).first
    @order_items = OrderItem.dashboard_summary
    @breakfasts = @order_items['Breakfast'] || []
    @lunches = @order_items['Lunch'] || []
    @dinners = @order_items['Dinner'] || []
    @specials = @order_items['Special'] || []
  end

  private

  [:inactive_customer_count, :active_customer_count, :customer_count].each do |type|
    define_method type do     
      unless instance_variable_defined? "@type"
        instance_variable_set "@#{type.to_s}", Customer.send(type.to_s.gsub('customer_', ''))
      end

      instance_variable_get "@#{type.to_s}"
    end
  end

  def location_count
    @location_count ||= Location.count
  end

  def gym_delivery_order_count
    @gym_delivery_order_count ||= Order.gym_delivery.count
  end

  def custom_delivery_order_count
    @custom_delivery_order_count ||= Order.custom_delivery.count
  end

  def instantiate_customer_and_build_relationships
    @customer = Customer.new
    @customer.addresses.build
    @customer.build_standard_order
  end
end
