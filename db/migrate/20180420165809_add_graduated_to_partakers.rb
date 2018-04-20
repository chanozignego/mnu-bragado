class AddGraduatedToPartakers < ActiveRecord::Migration
  def change
    add_column :partakers, :graduated, :boolean, null: false, default: false
  end
end
