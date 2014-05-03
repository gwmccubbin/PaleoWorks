class CustomerLocation < ActiveRecord::Base
  belongs_to :customer 
  belongs_to :location
  validates :customer_id, uniqueness: { scope: [:location_id] }

end
