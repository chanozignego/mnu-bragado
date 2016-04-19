class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|

      t.belongs_to :personable, index: true, polymorphic: true

      t.string :first_name
      t.string :last_name
      t.string :dni
      t.date :birthdate
      t.integer :age

      t.belongs_to :location, index: true

      t.string :phone_number
      t.string :email
      t.string :blood_type
      t.string :rh_factor
      t.string :medical_insurance
      t.string :medical_insurance_affiliate_number
      t.string :medical_insurance_phone_number
      t.string :emergency_person
      t.string :emergency_person_relationship
      t.string :emergency_person_phone_number      

      t.timestamps null: false
    end
  end
end
