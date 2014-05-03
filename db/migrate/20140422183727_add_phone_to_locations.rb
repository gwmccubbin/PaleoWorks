class AddPhoneToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :phone, :string
  end
end
