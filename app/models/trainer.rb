class Trainer < ActiveRecord::Base

  belongs_to :user, class_name: "User"

  accepts_nested_attributes_for :user

  delegate :first_name, :last_name, :email, :phone_number, to: :user, allow_nil: true

end
