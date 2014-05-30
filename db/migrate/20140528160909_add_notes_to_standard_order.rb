class AddNotesToStandardOrder < ActiveRecord::Migration
  def change
    add_column :standard_orders, :notes, :text
  end
end
