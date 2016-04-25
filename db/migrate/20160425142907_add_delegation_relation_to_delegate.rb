class AddDelegationRelationToDelegate < ActiveRecord::Migration
  def change
    change_table :delegations do |t|
	  t.belongs_to :sti_delegate, index: true
	  t.belongs_to :ag_delegate1, index: true
	  t.belongs_to :ag_delegate2, index: true
	  t.belongs_to :cs_delegate1, index: true
	  t.belongs_to :cs_delegate2, index: true
	  t.belongs_to :segib_delegate1, index: true
	  t.belongs_to :segib_delegate2, index: true
    end
  end
end
