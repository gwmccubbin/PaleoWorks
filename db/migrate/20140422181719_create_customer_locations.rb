class CreateCustomerLocations < ActiveRecord::Migration
  def change
    create_table :customer_locations do |t|
      t.integer :customer_id
      t.integer :location_id

      t.timestamps
    end
  end
end
