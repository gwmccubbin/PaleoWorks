class ChangeRecurringOrderAll < ActiveRecord::Migration
  def up
    rename_column :recurring_orders, :breakfast, :breakfast_qty
    rename_column :recurring_orders, :breakfast_lunch, :breakfast_lunch_qty
    rename_column :recurring_orders, :lunch, :lunch_qty
    rename_column :recurring_orders, :lunch_dinner, :lunch_dinner_qty
    rename_column :recurring_orders, :dinner, :dinner_qty 
  end

  def down
    rename_column :recurring_orders, :breakfast_qty, :breakfast
    rename_column :recurring_orders, :breakfast_lunch_qty, :breakfast_lunch
    rename_column :recurring_orders, :lunch_qty, :lunch
    rename_column :recurring_orders, :lunch_dinner_qty, :lunch_dinner
    rename_column :recurring_orders, :dinner_qty, :dinner
  end
end