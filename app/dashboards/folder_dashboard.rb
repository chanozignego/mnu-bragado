require "administrate/base_dashboard"

class FolderDashboard < ApplicationDashboard
  ALLOW_COLLECTION_ACTIONS = false
  PERMISSIONS = { 
                index: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                show: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                edit: [:superadmin, :coordination, :commission, :team_leader, :trainer],  
                update: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                destroy: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                create: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                new: [:superadmin, :coordination, :commission, :team_leader, :trainer]
              }

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::String,
    #folder: Field::HasOne,
    file_type_name: Field::String,
    classification_name: Field::String,
    file: Field::String,
    abstract_file_id: Field::String,
    file_type: Field::String,
    classification: Field::String,
    archive_type: Field::String,
    archive_type_name: Field::String,
    created_at: Field::DateTime
  }


  # COLLECTION_ATTRIBUTES
  COLLECTION_ATTRIBUTES = [
    :id, 
    :name #,
    #:folder,
    #:file_type_name,
    #:classification_name
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :description,
    :file_type_name,
    :classification_name,
    :archive_type_name,
    :file,
    :abstract_file_id
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :description,
    :file,
    :abstract_file_id,
    :file_type,
    :classification,
    :archive_type
  ]

  MASS_ASSIGNMENT_ACTIONS = [
  ]
  
  SEARCHABLE_ATTRIBUTES = [
    [:name_cont],
    [:description_cont]
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_abstract_files_path
  end


end
