class AddCueAndDirectorToSchool < ActiveRecord::Migration
  def change
    add_column :inscriptions, :cue, :string
    add_column :inscriptions, :director_name, :string

    add_column :schools, :cue, :string
    add_column :schools, :director_name, :string    
    
  end
end
