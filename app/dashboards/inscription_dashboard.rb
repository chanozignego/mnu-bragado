require "administrate/base_dashboard"

class InscriptionDashboard < ApplicationDashboard
  ALLOW_COLLECTION_ACTIONS = true
  PERMISSIONS = { 
                  index: [:superadmin, :coordination, :commission], 
                  show: [:superadmin, :coordination, :commission], 
                  edit:  [:superadmin, :coordination, :commission],
                  update:  [:superadmin, :coordination, :commission],  
                  destroy: [:superadmin, :coordination, :commission], 
                  create: [:superadmin, :coordination, :commission], 
                  new: [:superadmin, :coordination, :commission],
                  export_to_excel: [:superadmin, :coordination, :commission],
                  check_already_approved: [:superadmin, :coordination, :commission],
                }

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    full_name: Field::String,
    type_name: Field::String,
    already_approved: LabeledBooleanField,
    created_at: Field::DateTime
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :full_name,
    :type_name,
    :already_approved
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

  COLLECTION_ACTIONS = [{
    name: :export_to_excel,
    http_method: :get
  }]

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end

  SEARCHABLE_ATTRIBUTES = [
    [:id_eq, {input_html: {type: :number, min: 0}}],
    [:full_name_cont],
    [:type_eq, {as: :select, 
                  collection: Inscription.types,
                  include_blank: true,
                  input_html: { class: "form-control js-select2" },
                  value_method: :last,
                  label_method: -> (s) { 
                      I18n.t("inscription.types.#{s.first.try(:to_s)}") 
                    }
                  }]
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_inscriptions_path
  end
end
