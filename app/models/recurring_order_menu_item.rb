class RecurringOrderMenuItem < ActiveRecord::Base
  belongs_to :recurring_order
  belongs_to :menu_item
  validates :recurring_order_id, uniqueness: { scope: [:menu_item_id] }
end
