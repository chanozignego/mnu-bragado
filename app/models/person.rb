class Person < ActiveRecord::Base

  with_options dependent: :destroy do
    has_one :location, as: :locatable, inverse_of: :locatable
  end

  accepts_nested_attributes_for :location

  BLOOD_TYPES = ["0", "A", "B", "AB"]
  RH_BLOOD_FACTORS = ["+", "-"]

end
