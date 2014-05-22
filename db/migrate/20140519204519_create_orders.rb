class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.datetime :delivery_date
      t.integer :customer_id
      t.integer :location_id
      t.boolean :confirmed
      t.string :token
      t.string :challenge

      t.timestamps
    end
  end
end
