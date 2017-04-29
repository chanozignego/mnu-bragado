class Location < ActiveRecord::Base

  belongs_to :locatable, polymorphic: true

  # TODO: resolve this!
  PROVINCES = ISO3166::Country.new("AR").subdivisions.values.map { |p| p.try(:name) }.sort

  validates :province, inclusion: { in: PROVINCES, allow_nil: true }
  validates :city, presence: true
  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :zip_code, presence: true

end
