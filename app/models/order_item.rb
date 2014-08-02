class OrderItem < ActiveRecord::Base
  belongs_to :order 
  belongs_to :item

  delegate :id, :name, :price, to: :item, prefix: true
end
