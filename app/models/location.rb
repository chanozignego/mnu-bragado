class Location < ActiveRecord::Base

  belongs_to :locatable, polymorphic: true

  # TODO: resolve this!
  PROVINCES = [] 
  #ISO3166::Country.new("AR").
    #subdivisions.values.map { |p| p.fetch("name") }.sort

  validates :province, inclusion: { in: PROVINCES, allow_nil: true }

end
