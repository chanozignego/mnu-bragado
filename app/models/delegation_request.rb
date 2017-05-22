class DelegationRequest < ActiveRecord::Base

  belongs_to :school

  delegate :name, to: :school, prefix: true
end
