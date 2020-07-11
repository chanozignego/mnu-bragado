class AddAcceptTermsAndConditions < ActiveRecord::Migration
  def change
    add_column :inscriptions, :accept_terms_and_conditions, :boolean, null: false, default: false
  end
end
