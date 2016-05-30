class Delegation < ActiveRecord::Base

  has_many :delegates
  #belongs_to :sti_delegate, class_name: "Delegate"
  #belongs_to :ag_delegate1, class_name: "Delegate"
  #belongs_to :ag_delegate2, class_name: "Delegate"
  #belongs_to :cs_delegate1, class_name: "Delegate"
  #belongs_to :cs_delegate2, class_name: "Delegate"
  #belongs_to :segib_delegate1, class_name: "Delegate"
  #belongs_to :segib_delegate2, class_name: "Delegate"
  belongs_to :country

  #accepts_nested_attributes_for :sti_delegate, :ag_delegate1, :ag_delegate2, :cs_delegate1, :cs_delegate2, :segib_delegate1, :segib_delegate2
  accepts_nested_attributes_for :delegates

  delegate :name, to: :country, prefix: true, allow_nil: true

  def delegates_count
    self.delegates.count
  end

  def representative
    return self.delegates.first
  end

end
