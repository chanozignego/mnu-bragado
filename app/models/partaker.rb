class Partaker < ActiveRecord::Base
  
  scope :participated, -> { where(participated: true) }
  scope :not_participated, -> { where(participated: false) }

  ROLES = %i[ag cs segib sti]

  enum rol: ROLES

  with_options dependent: :destroy do
    has_one :person, as: :personable, inverse_of: :personable, class_name: "Person"
    has_one :medical_data, as: :medicable, class_name: "MedicalDatum"
  end

  belongs_to :professor, class_name: "Professor"
  belongs_to :school, class_name: "School"

  delegate :name, :location_city, :location_province, to: :school, allow_nil: true, prefix: true
  delegate :first_name, :last_name, :dni, :birthdate, :email, :phone_number, to: :person, allow_nil: true
  delegate :has_diet?, :has_medical_problems?, :is_vegetarian?, :specific_diet_detail, :medical_problems_detail, to: :medical_data, allow_nil: true, prefix: false
  delegate :country_name, to: :delegation, allow_nil: true, prefix: true

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :medical_data
  accepts_nested_attributes_for :professor
  accepts_nested_attributes_for :school

  def index_name
    "#{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{last_name} #{person.present? ? " - DNI #{person.dni}" : ""} #{school.present? ? " - Escuela #{school.name}" : ""}"
  end

  def formatted_is_vegetarian?
    is_vegetarian? ? "SI" : "NO"
  end

end
