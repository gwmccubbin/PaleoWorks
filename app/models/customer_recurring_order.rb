class CustomerRecurringOrder < ActiveRecord::Base
  belongs_to :customer
  belongs_to :recurring_order
  validates :customer_id, uniqueness: { scope: [:recurring_order_id] }
end
