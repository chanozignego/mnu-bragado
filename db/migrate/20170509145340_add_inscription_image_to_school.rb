class AddInscriptionImageToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :inscription_image, :string
  end
end
