class AddPayedInPartakers < ActiveRecord::Migration
  def change
    add_column :partakers, :paid, :boolean, null: false, default: false
  end
end
