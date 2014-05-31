class AddCustomerIdAndAddressIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :customer_id, :integer
    add_column :locations, :address_id, :integer
  end
end
