class AddDeliveryToCustomers < ActiveRecord::Migration
  def up
    remove_column :customers, :custom_delivery
    add_column :customers, :delivery, :boolean, default: false
  end

  def down
    add_column :customers, :custom_delivery, :boolean, default: false 
    remove_column :customers, :delivery   
  end
end
