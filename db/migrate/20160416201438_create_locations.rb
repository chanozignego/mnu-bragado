class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.belongs_to :locatable, index: true, polymorphic: true
      t.string :province
      t.string :city
      t.string :street_name
      t.string :street_number
      t.string :zip_code
      t.text :details

      t.timestamps null: false
    end
  end
end
