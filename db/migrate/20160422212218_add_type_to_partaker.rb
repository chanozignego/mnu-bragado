class AddTypeToPartaker < ActiveRecord::Migration
  def change
  	add_column :partakers, :type, :string
  end
end
