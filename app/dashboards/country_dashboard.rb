require "administrate/base_dashboard"

class CountryDashboard < ApplicationDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    regional_group: Field::String,
    regional_group_name: Field::String,
    created_at: Field::DateTime
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :regional_group_name,
    :created_at
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :regional_group
  ]

  MASS_ASSIGNMENT_ACTIONS = [
  #  :approve_revision
  ]

  SEARCHABLE_ATTRIBUTES = [
    [:name_cont],
    [:regional_group_eq, {as: :select, 
                  collection: Country.regional_groups,
                  include_blank: true,
                  input_html: { class: "form-control js-select2" },
                  value_method: :last,
                  label_method: -> (ft) { 
                      I18n.t("country.regional_groups.#{ft.first}") 
                    }
                  }],
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_countries_path
  end
end
