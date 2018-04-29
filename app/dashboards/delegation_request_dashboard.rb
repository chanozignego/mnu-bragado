require "administrate/base_dashboard"

class DelegationRequestDashboard < ApplicationDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    school_name: Field::String,
    school_id: Field::Number,
    school: Field::BelongsTo,
    ag_sti_count: Field::Number,
    ag_sti_cs_count: Field::Number,
    ag_sti_ecosoc_count: Field::Number,
    ag_sti_g20_count:  Field::Number,
    ag_sti_cs_ecosoc_count: Field::Number,
    ag_sti_cs_g20_count:  Field::Number,
    ag_sti_ecosoc_g20_count:  Field::Number,
    ag_sti_cs_ecosoc_g20_count:  Field::Number,
    observer_count: Field::Number,
    created_at: Field::DateTime
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :school_name,
    :ag_sti_count,
    :ag_sti_cs_count,
    :ag_sti_ecosoc_count,
    :ag_sti_g20_count,
    :ag_sti_cs_ecosoc_count,
    :ag_sti_cs_g20_count,
    :ag_sti_ecosoc_g20_count,
    :ag_sti_cs_ecosoc_g20_count,
    :observer_count
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :school_name,
    :ag_sti_count,
    :ag_sti_cs_count,
    :ag_sti_ecosoc_count,
    :ag_sti_g20_count,
    :ag_sti_cs_ecosoc_count,
    :ag_sti_cs_g20_count,
    :ag_sti_ecosoc_g20_count,
    :ag_sti_cs_ecosoc_g20_count,
    :observer_count,
    :created_at
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :school_name,
    :school_id,
    :school,
    :ag_sti_count,
    :ag_sti_cs_count,
    :ag_sti_ecosoc_count,
    :ag_sti_g20_count,
    :ag_sti_cs_ecosoc_count,
    :ag_sti_cs_g20_count,
    :ag_sti_ecosoc_g20_count,
    :ag_sti_cs_ecosoc_g20_count,
    :observer_count
  ]

  MASS_ASSIGNMENT_ACTIONS = [
  #  :approve_revision
  ]

  SEARCHABLE_ATTRIBUTES = [
    [:school_id_eq, {as: :select, 
                  collection: School.all,
                  include_blank: true,
                  input_html: { class: "form-control js-select2" },
                  value_method: :id,
                  label_method: -> (ft) { 
                      ft.try(:name) 
                    }
                  }]
  ]

  def self.search_path
    Rails.application.routes.url_helpers.admin_delegation_requests_path
  end
end
