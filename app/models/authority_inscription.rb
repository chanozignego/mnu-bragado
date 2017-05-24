class AuthorityInscription < Inscription

  validates :school, presence: true
  validates :school_id, presence: true
  validates :professor, presence: true
  validates :professor_id, presence: true
  validates :person, presence: true
  validates :medical_data, presence: true

  delegate :name, to: :professor, allow_nil: true, prefix: true
  delegate :name, :location_city, :location_province, to: :school, allow_nil: true, prefix: true
  delegate  :first_name, :last_name, :dni, :birthdate, :email, :phone_number, :age, 
            :blood_type, :rh_factor, :medical_insurance, :medical_insurance_affiliate_number, 
            :medical_insurance_phone_number, :emergency_person, :emergency_person_relationship, 
            :emergency_person_phone_number, to: :person, allow_nil: true
  delegate :has_chronic_desease, :chronic_desease_detail, :take_medication, :medication_detail, 
           :has_medical_background, :medical_background_detail, :has_allergy, :allergy_detail,
           :has_specific_diet, :specific_diet_detail, :is_vegetarian, :doctor_name, :doctor_phone_number,
           :urgency_clinic, to: :medical_data, allow_nil: true, prefix: false

  def professors
    school.try(:professors) || []
  end

  def name
    "#{first_name} #{last_name}"
  end

end
