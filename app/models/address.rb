class Address < ActiveRecord::Base
  belongs_to :customer
  belongs_to :location
  validates_presence_of :address1, :zip

  geocoded_by :full

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.address1 = geo.street_address
      obj.city = geo.city
      obj.state = geo.state
    end
  end

  before_validation :geocode
  before_validation :reverse_geocode

  def street
    "#{address1} #{address2}"    
  end

  def full
    "#{address1} #{address2} #{city}, #{state} #{zip}"
  end
end
