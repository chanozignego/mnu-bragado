class AddDelegationRelationToDelegate < ActiveRecord::Migration
  def change
    change_table :partakers do |t|
      t.belongs_to :delegation, index: true
    end
  end
end
