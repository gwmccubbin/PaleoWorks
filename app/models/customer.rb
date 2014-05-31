class Customer < ActiveRecord::Base
  validates_presence_of :first_name, :last_name
  has_many :addresses
  has_many :away_dates
  has_one :standard_order
  has_many :orders
  belongs_to :location
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :standard_order

  def full_name
    "#{first_name} #{last_name}"
  end

  def address
    addresses.first
  end
end