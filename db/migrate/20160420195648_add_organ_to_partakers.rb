class AddOrganToPartakers < ActiveRecord::Migration
  def change
  	add_column :partakers, :rol, :integer
  end
end
