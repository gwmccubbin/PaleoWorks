class DropCustomerLocations < ActiveRecord::Migration
  def change
    drop_table :customer_locations
  end
end
