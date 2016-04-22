class Partaker < ActiveRecord::Base
  
  ROLES = %i[ag cs segib sti]

  enum rol: ROLES

  with_options dependent: :destroy do
    has_one :person, as: :personable, class_name: "Person"
    has_one :medical_data, as: :medicable, class_name: "MedicalDatum"
  end

  #has_one :professor, class_name: "Professor"
  #has_one :school, class_name: "School"
  belongs_to :professor, class_name: "Professor"
  belongs_to :school, class_name: "School"

  delegate :first_name, :last_name, :email, :phone_number, to: :person, allow_nil: true

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :medical_data
  accepts_nested_attributes_for :professor
  accepts_nested_attributes_for :school
end
