class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :location
  has_many :order_items
  has_many :items, through: :order_items
end
