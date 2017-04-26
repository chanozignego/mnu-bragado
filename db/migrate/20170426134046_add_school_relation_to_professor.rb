class AddSchoolRelationToProfessor < ActiveRecord::Migration
  def change
    add_reference :professors, :school, index: true
  end
end
