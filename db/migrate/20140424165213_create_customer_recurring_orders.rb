class CreateCustomerRecurringOrders < ActiveRecord::Migration
  def change
    create_table :customer_recurring_orders do |t|
      t.integer :customer_id
      t.integer :recurring_order_id

      t.timestamps
    end
  end
end
