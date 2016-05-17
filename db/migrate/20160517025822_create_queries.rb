class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
    	t.string :name, null: false
      t.string :email, null: false
      t.string :phone_number
      t.text :message, null: false
      t.boolean :already_read, default: false

      t.timestamps null: false
    end
  end
end
