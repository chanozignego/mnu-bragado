class CreateMedicalData < ActiveRecord::Migration
  def change
    create_table :medical_data do |t|

      t.belongs_to :medicable, index: true, polymorphic: true

      t.boolean :has_chronic_desease, default: false
      t.string :chronic_desease_detail

      t.boolean :take_medication, default: false
      t.string :medication_detail

      t.boolean :has_medical_background, default: false
      t.string :medical_background_detail

      t.boolean :has_allergy, default: false
      t.string :allergy_detail

      t.boolean :has_specific_diet, default: false
      t.string :specific_diet_detail

      t.boolean :is_vegetarian, default: false

      t.string :doctor_name
      t.string :doctor_phone_number
      t.string :urgency_clinic

      t.timestamps null: false
    end
  end
end
