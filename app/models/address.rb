class Address < ActiveRecord::Base
  belongs_to :customer
  belongs_to :location
  validates_presence_of :address1, :city, :zip

  def street
    "#{address1} #{address2}"    
  end

  def full
    "#{address1} #{address2} #{city}, #{state} #{zip}"
  end
end
