class MenuItem < ActiveRecord::Base
  has_many :recurring_order_menu_items
  has_many :recurring_orders, through: :recurring_order_menu_items
end
