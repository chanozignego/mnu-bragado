class CreateDelegationRequests < ActiveRecord::Migration
  def change
    create_table :delegation_requests do |t|
      t.integer :ag_sti_count, default: 0
      t.integer :ag_sti_cs_count, default: 0
      t.integer :ag_sti_segib_count, default: 0
      t.integer :ag_sti_ecosoc_count, default: 0
      t.integer :ag_sti_cs_segib_count, default: 0
      t.integer :ag_sti_cs_ecosoc_count, default: 0
      t.integer :ag_sti_ecosoc_segib_count, default: 0
      t.integer :observer_count, default: 0

      t.belongs_to :school

      t.timestamps null: false
    end
  end
end
