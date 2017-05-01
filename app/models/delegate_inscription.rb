class DelegateInscription < Inscription

  validates :school, presence: true
  validates :school_id, presence: true
  validates :professor, presence: true
  validates :professor_id, presence: true
  validates :person, presence: true
  validates :medical_data, presence: true
  validates :rol, presence: true #if its authority, not

  def professors
    school.try(:professors) || []
  end

  def name
    "#{person.first_name} #{person.last_name}"
  end

end
