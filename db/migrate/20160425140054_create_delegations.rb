class CreateDelegations < ActiveRecord::Migration
  def change
    create_table :delegations do |t|
      t.string :country, null: false
      t.integer :year, null: false

      t.timestamps null: false
    end
  end
end
