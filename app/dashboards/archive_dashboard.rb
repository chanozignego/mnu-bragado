require "administrate/base_dashboard"

class ArchiveDashboard < ApplicationDashboard
  ALLOW_COLLECTION_ACTIONS = false
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

  # file: nil,
  # classification: 5,
  # file_type: 4,
  # abstract_file_id: nil,
  # type: "Folder",
  # archive_type: "2">]


  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
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
  #  :approve_revision
  ]

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
  
  SEARCHABLE_ATTRIBUTES = [
    [:name_cont],
    [:description_cont]

    # TODO: add file type filter
    # [:school_id_eq, {as: :select, 
    #               collection: School.all,
    #               include_blank: true,
    #               input_html: { class: "form-control js-select2" },
    #               value_method: :id,
    #               label_method: -> (s) { 
    #                   s.name
    #                 }
    #               }],
    # [:has_diet_eq, {as: :select, 
    #               collection: [[true, "Si"], [false, "No"]],
    #               include_blank: true,
    #               input_html: { class: "form-control js-select2" },
    #               value_method: :first,
    #               label_method: -> (s) { 
    #                   s.last
    #                 }
    #               }],
    # [:has_medical_problems_eq, {as: :select, 
    #               collection: [[true, "Si"], [false, "No"]],
    #               include_blank: true,
    #               input_html: { class: "form-control js-select2" },
    #               value_method: :first,
    #               label_method: -> (s) { 
    #                   s.last
    #                 }
    #               }]
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_authorities_path
  end


end
