class CreateAwayDates < ActiveRecord::Migration
  def change
    create_table :away_dates do |t|
      t.datetime :leave_date
      t.datetime :return_date

      t.timestamps
    end
  end
end
