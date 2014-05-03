class AddCustomerIDandLocationIdtoAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :customer_id, :integer
    add_column :addresses, :location_id, :integer
  end
end
