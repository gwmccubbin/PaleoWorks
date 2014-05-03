class ChangeRecurringOrder < ActiveRecord::Migration
  def up
    change_column :recurring_orders, :breakfast, :integer
    change_column :recurring_orders, :breakfast_lunch, :integer
    change_column :recurring_orders, :lunch, :integer
    change_column :recurring_orders, :lunch_dinner, :integer
    change_column :recurring_orders, :dinner, :integer
  end

  def down
    change_column :recurring_orders, :breakfast, :boolean, default: false
    change_column :recurring_orders, :breakfast_lunch, :boolean, default: false
    change_column :recurring_orders, :lunch, :boolean, default: false
    change_column :recurring_orders, :lunch_dinner, :boolean, default: false
    change_column :recurring_orders, :dinner, :boolean, default: false
  end
end
