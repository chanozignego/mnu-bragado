class RefactorCountryFields < ActiveRecord::Migration
  def change
    remove_column :countries, :segib

    add_column :countries, :g20, :boolean, default: false
  end
end
