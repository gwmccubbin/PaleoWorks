class RecurringOrder < ActiveRecord::Base
  has_many :customer_recurring_orders
  has_many :customers, through: :customer_recurring_orders
  has_many :recurring_order_menu_items
  has_many :menu_items, through: :recurring_order_menu_items
  # alias_attribute :b_qty, :breakfast_qty
  # alias_attribute :bl_qty, :breakfast_lunch_qty
  # alias_attribute :l_qty, :lunch_qty
  # alias_attribute :ld_qty, :lunch_dinner_qty 
  # alias_attribute :d_qty, :dinner_qty
  # alias_attribute :all_qty, :all_meals_qty     
  # scope :b -> { menu_items.where(meal_type: 'breakfast').first }
  # scope :bl -> { [menu_items.where(meal_type: 'breakfast').first, 
  #                 menu_items.where(meal_type: 'lunch').first] } # REFACTOR W/ SQL !!!
  # scope :l -> { menu_items.where(meal_type: 'lunch').first }
  # scope :ld -> { [menu_items.where(meal_type: 'lunch').first, 
  #                 menu_items.where(meal_type: 'dinner').first] } # REFACTOR W/ SQL !!!
  # scope :d -> { menu_items.where(meal_type: 'dinner').first }
  # scope :all_meals -> { [menu_items.where(meal_type: 'breakfast').first, 
  #                        menu_items.where(meal_type: 'lunch').first, 
  #                        menu_items.where(meal_type: 'dinner').first] } # REFACTOR W/ SQL !!!
  # scope :muffins -> { menu_items.where(meal_type: 'muffin').first } 


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
