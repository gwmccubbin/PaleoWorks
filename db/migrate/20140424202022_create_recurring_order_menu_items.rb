class CreateRecurringOrderMenuItems < ActiveRecord::Migration
  def change
    create_table :recurring_order_menu_items do |t|
      t.integer :recurring_order_id
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
