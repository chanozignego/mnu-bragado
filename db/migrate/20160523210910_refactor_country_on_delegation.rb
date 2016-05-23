class RefactorCountryOnDelegation < ActiveRecord::Migration
  def change
  	remove_column :delegations, :country
  	add_reference :delegations, :country, index: true, foreign_key: true
  end
end
