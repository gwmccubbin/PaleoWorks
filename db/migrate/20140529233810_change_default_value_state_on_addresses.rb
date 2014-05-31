class ChangeDefaultValueStateOnAddresses < ActiveRecord::Migration
  def up
    change_column :addresses, :state, :string, default: nil
  end

  def down
    change_column :addresses, :state, :string, default: "TN"
  end
end
