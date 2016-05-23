class Delegation < ActiveRecord::Base

  belongs_to :sti_delegate, class_name: "Delegate"
  belongs_to :ag_delegate1, class_name: "Delegate"
  belongs_to :ag_delegate2, class_name: "Delegate"
  belongs_to :cs_delegate1, class_name: "Delegate"
  belongs_to :cs_delegate2, class_name: "Delegate"
  belongs_to :segib_delegate1, class_name: "Delegate"
  belongs_to :segib_delegate2, class_name: "Delegate"
  belongs_to :country

  delegate :name, to: :country, prefix: true, allow_nil: true

  def delegates_count
  	count = 0
  	%i[sti_delegate ag_delegate1 ag_delegate2 cs_delegate1 cs_delegate2 segib_delegate1 segib_delegate2].each do |delegate|
  		count += 1 if self.send(delegate).present?
  	end  	
  	count
  end

end
