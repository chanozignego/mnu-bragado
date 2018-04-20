require "administrate/base_dashboard"

class AuthorityDashboard < ApplicationDashboard
  ALLOW_COLLECTION_ACTIONS = true
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    graduated: LabeledBooleanField,
    first_name: Field::String,
    last_name: Field::String,
    email: Field::String,
    phone_number: Field::String,
    has_medical_problems?: LabeledBooleanField, 
    has_diet?: LabeledBooleanField, 
    school_year: Field::String, 
    orientation: Field::String,
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
    :has_medical_problems?,
    :has_diet?
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

  COLLECTION_ACTIONS = [{
    name: :export_to_excel,
    http_method: :get
  }]
  
  SEARCHABLE_ATTRIBUTES = [
    [:full_name_cont],
    [:email_cont],
    [:dni_cont],
    [:school_id_eq, {as: :select, 
                  collection: School.all,
                  include_blank: true,
                  input_html: { class: "form-control js-select2" },
                  value_method: :id,
                  label_method: -> (s) { 
                      s.name
                    }
                  }],
    [:has_diet_eq, {as: :select, 
                  collection: [[true, "Si"], [false, "No"]],
                  include_blank: true,
                  input_html: { class: "form-control js-select2" },
                  value_method: :first,
                  label_method: -> (s) { 
                      s.last
                    }
                  }],
    [:has_medical_problems_eq, {as: :select, 
                  collection: [[true, "Si"], [false, "No"]],
                  include_blank: true,
                  input_html: { class: "form-control js-select2" },
                  value_method: :first,
                  label_method: -> (s) { 
                      s.last
                    }
                  }]
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_authorities_path
  end


end
