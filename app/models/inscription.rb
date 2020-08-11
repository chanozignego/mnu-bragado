class Inscription < ActiveRecord::Base

  ROLES = %i[ag cs segib sti ecosoc]
  #PARTAKER_TYPES = %i[delegate authority]

  enum rol: ROLES
  #enum partaker_type: PARTAKER_TYPES

  with_options dependent: :destroy do
    has_one :person, as: :personable, inverse_of: :personable, class_name: "Person"
    has_one :medical_data, as: :medicable, class_name: "MedicalDatum"
    has_one :location, as: :locatable, inverse_of: :locatable
  end

  belongs_to :professor, class_name: "Professor"
  belongs_to :school, class_name: "School"

  delegate :name, :location_city, :location_province, to: :school, allow_nil: true, prefix: true
  delegate :email, to: :person, allow_nil: true, prefix: true

  # delegate :name, :location_city, :location_province, to: :school, allow_nil: true, prefix: true
  # delegate :first_name, :last_name, :dni, :birthdate, :email, :phone_number, to: :person, allow_nil: true
  # delegate :has_diet?, :has_medical_problems?, :is_vegetarian?, :specific_diet_detail, :medical_problems_detail, to: :medical_data, allow_nil: true, prefix: false
  # delegate :country_name, to: :delegation, allow_nil: true, prefix: true
  # delegate :province, :city, :street_name, :street_number, :zip_code, to: :location, prefix: true, allow_nil: true

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :medical_data
  accepts_nested_attributes_for :professor
  accepts_nested_attributes_for :school
  accepts_nested_attributes_for :location

  def self.types
    {school: "SchoolInscription", professor: "ProfessorInscription", delegate: "DelegateInscription", authority: "AuthorityInscription"}
  end

  def type_name
    if is_a?(ProfessorInscription)
      "Profesor"
    elsif is_a?(DelegateInscription)
      "Delegado"
    elsif is_a?(AuthorityInscription)
      "Autoridad"
    elsif is_a?(SchoolInscription)
      "Escuela"
    else
      "Participante"
    end
  end

  def full_name
    if self.name.present?
      self.name
    elsif person.present? 
      "#{person.first_name} #{person.last_name}"
    else 
      ""
    end
  end

  def formatted_already_approved
    if already_approved
      "SI"
    else
      "NO"
    end
  end

end
