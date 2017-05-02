class SchoolInscription < Inscription

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :location, presence: true

  delegate :province, :city, :street_name, :street_number, :zip_code, to: :location, prefix: true, allow_nil: true

end
