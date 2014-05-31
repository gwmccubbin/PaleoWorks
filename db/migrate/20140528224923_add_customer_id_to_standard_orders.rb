class AddCustomerIdToStandardOrders < ActiveRecord::Migration
  def change
    add_column :standard_orders, :customer_id, :integer
  end
end
