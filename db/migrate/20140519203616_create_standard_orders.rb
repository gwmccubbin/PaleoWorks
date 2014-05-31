class CreateStandardOrders < ActiveRecord::Migration
  def change
    create_table :standard_orders do |t|
      t.integer :breakfast_qty
      t.integer :lunch_qty
      t.integer :dinner_qty
      t.boolean :recurring

      t.timestamps
    end
  end
end
