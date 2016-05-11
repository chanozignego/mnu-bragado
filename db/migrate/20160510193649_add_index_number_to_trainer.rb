class AddIndexNumberToTrainer < ActiveRecord::Migration
  def change
  	add_column :trainers, :index_number, :integer, default: 0
  end
end
