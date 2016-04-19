class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|

      t.belongs_to :people, index: true
      t.belongs_to :medical_data, index: true

      t.timestamps null: false
    end
  end
end
