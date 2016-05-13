class AddImageNameToTrainers < ActiveRecord::Migration
  def change
  	add_column :trainers, :principal_image_name, :string, default: ""
  end
end
