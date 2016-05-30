class RefactorDelegationsAndDelegateRelation < ActiveRecord::Migration
  def change
  	remove_column :delegations, :sti_delegate_id
  	remove_column :delegations, :ag_delegate1_id
  	remove_column :delegations, :ag_delegate2_id
  	remove_column :delegations, :cs_delegate1_id
  	remove_column :delegations, :cs_delegate2_id
  	remove_column :delegations, :segib_delegate1_id
  	remove_column :delegations, :segib_delegate2_id

  	add_reference :partakers, :delegation, index: true
  end
end
