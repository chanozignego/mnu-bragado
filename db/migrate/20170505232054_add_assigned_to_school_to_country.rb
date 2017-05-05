class AddAssignedToSchoolToCountry < ActiveRecord::Migration
  def change
    add_reference :countries, :school, index: true
  end
end
