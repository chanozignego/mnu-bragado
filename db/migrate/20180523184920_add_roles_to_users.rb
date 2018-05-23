class AddRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roles, :text, array: true, default: ["trainer"]
  end
end
