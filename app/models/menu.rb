class Menu < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  has_many :items, through: :menu_items
  accepts_nested_attributes_for :menu_items
  validates :name, presence: true

  scope :current, -> { where('start_date < ?', Time.now).where('end_date > ?', Time.now) }

  def current?
    Menu.current.include?(self)
  end
end