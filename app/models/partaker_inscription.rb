class PartakerInscription < Inscription

  validates :school, presence: true
  validates :professor, presence: true
  validates :person, presence: true
  validates :medical_data, presence: true
  validates :partaker_type, presence: true
  validates :rol, presence: true #if its authority, not

end
