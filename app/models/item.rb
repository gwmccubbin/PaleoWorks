class Item < ActiveRecord::Base
  belongs_to :item_type
  has_many :order_items
  has_many :menu_items
  has_many :menus, through: :menu_items
  validates_numericality_of :cost, :price
  validates_presence_of :name, :price, :item_type_id
  scope :breakfasts, -> { where(item_type_id: ItemType.breakfast_id) }
  scope :lunches, -> { where(item_type_id: ItemType.lunch_id) }
  scope :dinners, -> { where(item_type_id: ItemType.dinner_id) }
end
