class AddVisibleToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :visible, :boolean, default: false
    add_reference :trainers, :people, index: true
    add_reference :trainers, :medical_data, index: true
  end
end
