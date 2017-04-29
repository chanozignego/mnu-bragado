class ProfessorInscription < Inscription

  validates :school, presence: true
  validates :school_id, presence: true
  validates :person, presence: true
  validates :medical_data, presence: true

end
