class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :phone_number
      t.string :fax_number
      t.string :email

      t.belongs_to :location, index: true

      t.timestamps null: false
    end
  end
end

