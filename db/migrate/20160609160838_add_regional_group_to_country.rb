class AddRegionalGroupToCountry < ActiveRecord::Migration
  def change
  	add_column :countries, :regional_group, :integer
  end
end
