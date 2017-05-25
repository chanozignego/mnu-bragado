class CreateAbstractFiles < ActiveRecord::Migration
  def change
    create_table :abstract_files do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :file
      t.integer :classification
      t.integer :file_type

      t.timestamps null: false
    end
  end
end
