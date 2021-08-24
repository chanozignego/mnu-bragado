class Person < ActiveRecord::Base

	belongs_to :personable

  with_options dependent: :destroy do
    has_one :location, as: :locatable, inverse_of: :locatable
  end

  accepts_nested_attributes_for :location

  BLOOD_TYPES = ["0", "A", "B", "AB"]
  RH_BLOOD_FACTORS = ["+", "-"]

  validates :first_name, :last_name, :dni, :birthdate, :age, 
            :phone_number, :email, presence: true,
            :blood_type, :rh_factor, 
            # :medical_insurance, :medical_insurance_affiliate_number, :medical_insurance_phone_number, 
            :emergency_person,  :emergency_person_relationship, :emergency_person_phone_number

end
