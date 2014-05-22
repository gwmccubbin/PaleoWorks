class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :qty
      t.decimal :price

      t.timestamps
    end
  end
end
