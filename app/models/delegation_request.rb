class DelegationRequest < ActiveRecord::Base

  belongs_to :school

  delegate :name, to: :school, prefix: true

  def total
    ag_sti_count + 
    ag_sti_cs_count + 
    ag_sti_ecosoc_count + 
    ag_sti_cs_ecosoc_count + 
    observer_count + 
    ag_sti_g20_count + 
    ag_sti_cs_g20_count + 
    ag_sti_ecosoc_g20_count + 
    ag_sti_cs_ecosoc_g20_count
  end
end
