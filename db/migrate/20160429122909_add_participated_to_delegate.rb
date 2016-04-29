class AddParticipatedToDelegate < ActiveRecord::Migration
  def change
  	add_column :partakers, :participated, :boolean, default: false
  end
end
