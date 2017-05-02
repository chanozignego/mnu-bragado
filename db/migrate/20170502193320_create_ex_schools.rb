class CreateExSchools < ActiveRecord::Migration
  def change
    create_table :ex_schools do |t|
     
      t.string :name, null: false
      t.string :email
      t.string :phone_number
      t.string :city_name, null: false, default: "Bragado"
      t.integer :year, null: false

      t.timestamps null: false
    end
  end
end
