class AddSpecialQtyToStandardOrder < ActiveRecord::Migration
  def change
    add_column :standard_orders, :special_qty, :integer
  end
end
