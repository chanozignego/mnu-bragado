class Trainer < ActiveRecord::Base

  belongs_to :user, class_name: "User"

  with_options dependent: :destroy do
    has_one :person, as: :personable, inverse_of: :personable, class_name: "Person"
    has_one :medical_data, as: :medicable, class_name: "MedicalDatum"
  end

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :person
  accepts_nested_attributes_for :medical_data

  mount_uploader :principal_image, PictureUploader
  mount_uploader :secondary_image, PictureUploader

  delegate :first_name, :last_name, :dni, :email, :phone_number, to: :user, allow_nil: true

  BLOOD_TYPES = ["0", "A", "B", "AB"]
  RH_BLOOD_FACTORS = ["+", "-"]

  def full_name
  	"#{first_name} #{last_name}"
  end

  def index_name
    "#{first_name} #{last_name}"
  end

end
