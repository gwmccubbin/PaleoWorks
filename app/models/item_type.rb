class ItemType < ActiveRecord::Base
  has_many :items

  class << self

    def breakfast_id
      where('name LIKE ?', 'Breakfast').first.id  
    end
    
    def lunch_id
      where('name LIKE ?', 'Lunch').first.id  
    end
    
    def dinner_id
      where('name LIKE ?', 'Dinner').first.id  
    end
    
    def special_id
      where('name LIKE ?', 'Special').first.id  
    end
  end
end
