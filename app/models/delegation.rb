class Delegation < ActiveRecord::Base

  has_many :delegates
  belongs_to :country

  accepts_nested_attributes_for :delegates

  delegate :name, to: :country, prefix: true, allow_nil: true

  def delegates_count
    self.delegates.count
  end

  def representative
    return self.delegates.first.try(:index_name)
  end

end
