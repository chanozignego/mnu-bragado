require "administrate/base_dashboard"

class SchoolDashboard < ApplicationDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    location_province: Field::String,
    location_city: Field::String,
    location_street: Field::String,
    email: Field::String,
    phone_number: Field::String,
    created_at: Field::DateTime
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :location_province,
    :location_city,
    :location_street,
    :phone_number,
    :email
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :location_province,
    :location_city,
    :location_street,
    :phone_number,
    :email
  ]

  COLLECTION_ACTIONS = [{
    name: :export_to_excel,
    http_method: :get
  }]

  MASS_ASSIGNMENT_ACTIONS = [
  #  :approve_revision
  ]

  SEARCHABLE_ATTRIBUTES = [
    [:name_cont],
    [:email_cont],
    [:province_eq, {as: :select, 
              collection: Location::PROVINCES,
              include_blank: true,
              input_html: { class: "form-control js-select2" }
              }],
    [:city_cont],
    [:street_cont]
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_schools_path
  end

end
