class AddMedicalDataToTrainers < ActiveRecord::Migration
  def change
    # add_reference :trainers, :medical_data, foreign_key: true
    add_column :trainers, :trainer_from, :integer, default: 2013
    add_column :trainers, :university, :string
    add_column :trainers, :career, :string

    add_column :trainers, :dni, :string
    add_column :trainers, :birthdate, :date
    add_column :trainers, :age, :integer

    add_column :trainers, :blood_type, :string
    add_column :trainers, :rh_factor, :string

    add_column :trainers, :medical_insurance, :string
    add_column :trainers, :medical_insurance_affiliate_number, :string
    add_column :trainers, :medical_insurance_phone_number, :string

    add_column :trainers, :emergency_person, :string
    add_column :trainers, :emergency_person_relationship, :string
    add_column :trainers, :emergency_person_phone_number, :string

  end
end
