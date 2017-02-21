class AddRoleAndDniToExpartaker < ActiveRecord::Migration
  def change
    add_column :ex_partakers, :role, :string
    add_column :ex_partakers, :dni, :string
  end
end
