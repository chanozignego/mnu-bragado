require "administrate/base_dashboard"

class TrainerDashboard < ApplicationDashboard
  ALLOW_COLLECTION_ACTIONS = true
  PERMISSIONS = { 
                index: [:superadmin, :coordination, :commission], 
                show: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                edit:  [:superadmin, :coordination, :commission, :team_leader, :trainer],
                update:  [:superadmin, :coordination, :commission, :team_leader, :trainer],  
                destroy: [:superadmin, :coordination, :commission], 
                create: [:superadmin, :coordination, :commission], 
                new: [:superadmin, :coordination, :commission], 
                change_password: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                update_password: [:superadmin, :coordination, :commission, :team_leader, :trainer] 
              }

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
    rol: Field::String,
    index_number: Field::Number,
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
    :rol,
    :index_number
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

  SEARCHABLE_ATTRIBUTES = [
    [:id_eq, {input_html: {type: :number, min: 0}}],
    [:full_name_cont]
  ]

  COLLECTION_ACTIONS = [{
    name: :export_to_excel,
    http_method: :get
  }]

  def self.search_path
    Rails.application.routes.url_helpers.admin_trainers_path
  end

end
