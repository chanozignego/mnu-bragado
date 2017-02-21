class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.integer :delegations, null: false, default: 0
      t.integer :partakers, null: false, default: 0
      t.integer :delegates, null: false, default: 0
      t.integer :authorities, null: false, default: 0
      t.integer :year, null: false, default: 2012


      t.timestamps null: false
    end
  end
end
