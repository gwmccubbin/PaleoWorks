class Location < ActiveRecord::Base
  belongs_to :customer
  has_one :address
  has_many :orders
end
