require "administrate/base_dashboard"

class ExPartakerDashboard < ApplicationDashboard

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
    dni: Field::String,
    email: Field::String,
    phone_number: Field::String,
    school_name: Field::String,
    city_name: Field::String,
    country_name: Field::String,
    partaker_type_name: Field::String,
    role_name: Field::String,
    year: Field::Number,
    created_at: Field::DateTime
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :first_name,
    :last_name,
    :email,
    :phone_number,
    :school_name,
    :city_name,
    :partaker_type_name,
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

  SEARCHABLE_ATTRIBUTES = [
    [:full_name_cont],
    [:email_cont],
    [:dni_cont],
    [:school_name_cont],
    [:city_name_cont],
    [:partaker_type_eq, {as: :select, 
                  collection: ExPartaker.partaker_types,
                  include_blank: true,
                  input_html: { class: "form-control js-select2" },
                  value_method: :last,
                  label_method: -> (ft) { 
                      I18n.t("ex_partaker.partaker_types.#{ft.first}") 
                    }
                  }],
    [:year_eq]
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_ex_partakers_path
  end
end
