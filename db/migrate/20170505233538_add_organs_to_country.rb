class AddOrgansToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :ag, :boolean, default: true
    add_column :countries, :sti, :boolean, default: true
    add_column :countries, :cs, :boolean, default: false
    add_column :countries, :segib, :boolean, default: false
    add_column :countries, :ecosoc, :boolean, default: false
  end
end
