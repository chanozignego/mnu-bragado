class AddAlreadyApprovedToInscription < ActiveRecord::Migration
  def change
    add_column :inscriptions, :already_approved, :boolean, null: false, default: false
  end
end
