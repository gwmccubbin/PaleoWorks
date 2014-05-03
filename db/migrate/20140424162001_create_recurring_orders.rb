class CreateRecurringOrders < ActiveRecord::Migration
  def change
    create_table :recurring_orders do |t|
      t.boolean :breakfast, default: false
      t.boolean :breakfast_lunch, default: false
      t.boolean :lunch, default: false
      t.boolean :lunch_dinner, default: false
      t.boolean :dinner, default: false

      t.timestamps
    end
  end
end