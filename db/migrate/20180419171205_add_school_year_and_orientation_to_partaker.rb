class AddSchoolYearAndOrientationToPartaker < ActiveRecord::Migration
  def change
    add_column :inscriptions, :orientation, :string
    add_column :inscriptions, :school_year, :string

    add_column :partakers, :orientation, :string
    add_column :partakers, :school_year, :string
  end
end
