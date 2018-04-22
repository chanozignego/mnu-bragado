require "administrate/base_dashboard"

class ExProfessorDashboard < ApplicationDashboard

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    email: Field::String,
    phone_number: Field::String,
    school_name: Field::String,
    city_name: Field::String,
    year: Field::Number,
    created_at: Field::DateTime
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id, 
    :first_name,
    :last_name,
    :email,
    :phone_number,
    :school_name,
    :city_name,
    :year

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
  ]

  COLLECTION_ACTIONS = [{
    name: :import_from_excel,
    http_method: :post
  }]

  SEARCHABLE_ATTRIBUTES = [
    [:full_name_cont],
    [:email_cont],
    [:school_name_cont],
    [:city_name_cont],
    [:year_eq]
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_ex_professors_path
  end
end
