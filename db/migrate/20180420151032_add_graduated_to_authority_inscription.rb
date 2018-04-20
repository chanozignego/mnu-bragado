class AddGraduatedToAuthorityInscription < ActiveRecord::Migration
  def change
    add_column :inscriptions, :graduated, :boolean, null: false, default: false
  end
end
