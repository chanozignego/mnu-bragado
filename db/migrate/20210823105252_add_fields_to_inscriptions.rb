class AddFieldsToInscriptions < ActiveRecord::Migration
  def change
    add_column :inscriptions, :tutors_email, :string, null: true
    add_column :inscriptions, :presential_activities, :boolean, null: false, default: false
    
    add_column :partakers, :tutors_email, :string, null: true
    add_column :partakers, :presential_activities, :boolean, null: false, default: true
  end
end
