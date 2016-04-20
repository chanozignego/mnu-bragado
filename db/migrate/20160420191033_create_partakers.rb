class CreatePartakers < ActiveRecord::Migration
  def change
    create_table :partakers do |t|

      t.belongs_to :people, index: true
      t.belongs_to :medical_data, index: true
      t.belongs_to :professor, index: true
      t.belongs_to :school, index: true

      t.timestamps null: false
    end
  end
end
