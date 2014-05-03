class AddCustomDeliveryToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :custom_delivery, :boolean, default: false
  end
end
