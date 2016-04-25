class Delegation < ActiveRecord::Base

  belongs_to :sti_delegate, class_name: "Delegate"
  belongs_to :ag_delegate1, class_name: "Delegate"
  belongs_to :ag_delegate2, class_name: "Delegate"
  belongs_to :cs_delegate1, class_name: "Delegate"
  belongs_to :cs_delegate2, class_name: "Delegate"
  belongs_to :segib_delegate1, class_name: "Delegate"
  belongs_to :segib_delegate2, class_name: "Delegate"


end
