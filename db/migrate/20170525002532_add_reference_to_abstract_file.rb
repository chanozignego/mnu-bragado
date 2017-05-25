class AddReferenceToAbstractFile < ActiveRecord::Migration
  def change
    add_reference :abstract_files, :abstract_file, index: true, foreign_key: true
    add_column :abstract_files, :type, :string
    add_column :abstract_files, :archive_type, :integer
  end
end
