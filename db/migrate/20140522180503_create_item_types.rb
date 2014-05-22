class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|

      t.timestamps
    end
  end
end
