class Customer < ActiveRecord::Base
  has_many :addresses
  has_many :away_dates
  has_one :standard_order
  has_many :orders
  belongs_to :location
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :standard_order

  validates :first_name, :last_name, presence: true
  validates :location, presence: true, unless: :delivery?
  validates :addresses, presence: true, if: :delivery?

  delegate :name, to: :location, prefix: true, allow_nil: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def address
    addresses.first
  end
end