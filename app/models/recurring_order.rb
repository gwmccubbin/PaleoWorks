class RecurringOrder < ActiveRecord::Base
  has_many :customer_recurring_orders
  has_many :customers, through: :customer_recurring_orders
  has_many :recurring_order_menu_items
  has_many :menu_items, through: :recurring_order_menu_items

  def subtotal
    
  end

  def tax
    
  end

  def total
    subtotal + tax
  end

  def associate_menu_items
    
  end
end
