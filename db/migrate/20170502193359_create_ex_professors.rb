class CreateExProfessors < ActiveRecord::Migration
  def change
    create_table :ex_professors do |t|
     
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :phone_number
      t.string :school_name, null: false
      t.string :city_name, null: false, default: "Bragado"
      t.integer :year, null: false

      t.timestamps null: false
    end
  end
end
