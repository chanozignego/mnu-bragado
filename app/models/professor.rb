class Professor < ActiveRecord::Base

  with_options dependent: :destroy do
    has_one :person, as: :personable, class_name: "Person"
    has_one :medical_data, as: :medicable, class_name: "MedicalDatum"
  end

  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :medical_data

  delegate :first_name, :last_name, :email, :dni, :birthdate, :phone_number, to: :person, allow_nil: true

  def full_name
  	"#{first_name} #{last_name}"
  end	

end
