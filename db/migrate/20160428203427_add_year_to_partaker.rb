class AddYearToPartaker < ActiveRecord::Migration
  def change
  	add_column :partakers, :year, :integer
  end
end
