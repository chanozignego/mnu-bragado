class AddPhoneNumberToUser < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :string, default: ""
  	add_column :users, :dni, :string, default: ""
  end
end
