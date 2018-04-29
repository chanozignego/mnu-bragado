class RefactorDelegationRequestFields < ActiveRecord::Migration
  def change
    remove_column :delegation_requests, :ag_sti_segib_count
    remove_column :delegation_requests, :ag_sti_cs_segib_count
    remove_column :delegation_requests, :ag_sti_ecosoc_segib_count

    add_column :delegation_requests, :ag_sti_g20_count, :integer, null: false, default: 0
    add_column :delegation_requests, :ag_sti_cs_g20_count, :integer, null: false, default: 0
    add_column :delegation_requests, :ag_sti_ecosoc_g20_count, :integer, null: false, default: 0
    add_column :delegation_requests, :ag_sti_cs_ecosoc_g20_count, :integer, null: false, default: 0
  end
end
