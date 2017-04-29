class AuthorityInscription < Inscription

  validates :school, presence: true
  validates :school_id, presence: true
  validates :professor, presence: true
  validates :professor_id, presence: true
  validates :person, presence: true
  validates :medical_data, presence: true

  def professors
    school.try(:professors) || []
  end

end
