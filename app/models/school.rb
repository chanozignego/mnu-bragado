class School < ActiveRecord::Base

	with_options dependent: :destroy do
	  has_one :location, as: :locatable, inverse_of: :locatable
	end

  has_many :professors

	accepts_nested_attributes_for :location

	delegate :province, :city, :street_name, :street_number, :zip_code, to: :location, prefix: true, allow_nil: true

	def location_street
		"#{location_street_name}, #{location_street_number}"
	end

end
