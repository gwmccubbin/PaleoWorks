class OrderItem < ActiveRecord::Base
  belongs_to :order 
  belongs_to :item

  delegate :price, to: :item, prefix: true
end
