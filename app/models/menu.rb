class Menu < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  has_many :items, through: :menu_items
  accepts_nested_attributes_for :menu_items
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


  scope :current, -> { where('start_date <= :date AND end_date >= :date', date: Date.today) }

  def current?
    start_date <= Date.today and end_date >= Date.today
  end
end