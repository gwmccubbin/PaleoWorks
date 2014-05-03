class AddAllMealsToRecurringOrders < ActiveRecord::Migration
  def change
    add_column :recurring_orders, :all_meals_qty, :integer
  end
end
