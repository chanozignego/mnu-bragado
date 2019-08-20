class CountryPicture < ActiveRecord::Base

  belongs_to :country, class_name: "Country"

  mount_uploader :image, PictureUploader

  delegate :slug, to: :country, prefix: false, allow_nil: true
end
