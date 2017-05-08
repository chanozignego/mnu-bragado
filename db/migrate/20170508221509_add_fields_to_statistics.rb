class AddFieldsToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :views, :integer, default: 0
    add_column :statistics, :inscriptions, :integer, default: 0
    add_column :statistics, :queries, :integer, default: 0
    add_column :statistics, :persons, :integer, default: 0
  end
end
