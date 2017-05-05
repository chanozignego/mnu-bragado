class AddStateToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :state, :integer, default: 0
  end
end
