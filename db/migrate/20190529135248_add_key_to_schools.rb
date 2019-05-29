class AddKeyToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :key, :string, null: false, default: ""
  end
end
