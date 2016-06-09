class Trainer < ActiveRecord::Base

  belongs_to :user, class_name: "User"

  accepts_nested_attributes_for :user

  mount_uploader :principal_image, PictureUploader
  mount_uploader :secondary_image, PictureUploader

  delegate :first_name, :last_name, :dni, :email, :phone_number, to: :user, allow_nil: true

  def full_name
  	"#{first_name} #{last_name}"
  end

end
