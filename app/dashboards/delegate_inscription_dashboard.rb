require "administrate/base_dashboard"

class DelegateInscriptionDashboard < ApplicationDashboard
  ALLOW_COLLECTION_ACTIONS = true
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    participated: LabeledBooleanField, 
    school_name: Field::String,
    professor_name: Field::String, 
    rol: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    dni: Field::String,
    birthdate: Field::String,
    age: Field::String,
    email: Field::String,
    phone_number: Field::String,
    school_year: Field::String, 
    orientation: Field::String,
    blood_type: Field::String, 
    rh_factor: Field::String, 
    medical_insurance: Field::String,
    medical_insurance_affiliate_number: Field::String,
    medical_insurance_phone_number: Field::String,
    emergency_person: Field::String,
    emergency_person_relationship: Field::String,
    emergency_person_phone_number: Field::String,
    has_chronic_desease: LabeledBooleanField, 
    chronic_desease_detail: Field::String, 
    take_medication: LabeledBooleanField, 
    medication_detail: Field::String, 
    has_medical_background: LabeledBooleanField, 
    medical_background_detail: Field::String, 
    has_allergy: LabeledBooleanField, 
    allergy_detail: Field::String,
    has_specific_diet: LabeledBooleanField, 
    specific_diet_detail: Field::String, 
    is_vegetarian: LabeledBooleanField, 
    doctor_name: Field::String, 
    doctor_phone_number: Field::String,
    urgency_clinic: Field::String,
    tutors_email: Field::String,
    presential_activities: LabeledBooleanField, 
    created_at: Field::DateTime
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
  ]

  MASS_ASSIGNMENT_ACTIONS = [
  #  :approve_revision
  ]

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end

  SEARCHABLE_ATTRIBUTES = [
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_inscriptions_path
  end
end
