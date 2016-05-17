require "administrate/fields/base"

class LabeledBooleanField < Administrate::Field::Base
  def to_s
    data
  end
end
