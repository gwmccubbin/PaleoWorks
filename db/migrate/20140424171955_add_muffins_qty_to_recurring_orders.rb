class AddMuffinsQtyToRecurringOrders < ActiveRecord::Migration
  def change
    add_column :recurring_orders, :muffins_qty, :integer
  end
end
