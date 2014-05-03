class AddCustomerIdToCustomerLocations < ActiveRecord::Migration
  def up
    remove_column :customer_locations, :cutomer_id
    add_column :customer_locations, :customer_id, :integer
  end

  def down
    add_column :customer_locations, :cutomer_id, :integer
    remove_column :customer_locations, :customer_id  
  end
end
