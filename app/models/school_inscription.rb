class SchoolInscription < Inscription

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :location, presence: true

end
