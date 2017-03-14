class CreateInscriptions < ActiveRecord::Migration
  def change
    create_table :inscriptions do |t|

      # For Schools:
      t.string :name
      t.string :phone_number
      t.string :fax_number
      t.string :email
      t.belongs_to :location, index: true

      # For Professors:
      t.belongs_to :people, index: true
      t.belongs_to :medical_data, index: true

      # For Partakers: 
      # t.belongs_to :people, index: true
      # t.belongs_to :medical_data, index: true
      t.belongs_to :professor, index: true
      t.belongs_to :school, index: true
      t.integer    :rol
      t.integer    :partaker_type
      t.boolean    :participated, default: false

      t.string     :type
      t.timestamps null: false
    end
  end
end
