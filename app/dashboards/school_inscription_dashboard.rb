require "administrate/base_dashboard"

class SchoolInscriptionDashboard < ApplicationDashboard
  ALLOW_COLLECTION_ACTIONS = true
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    phone_number: Field::String,
    email: Field::String,
    location_province: Field::String,
    location_city: Field::String,
    location_street_name: Field::String,
    location_street_number: Field::String,
    location_zip_code: Field::String,
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
