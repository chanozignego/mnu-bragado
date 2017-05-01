class ProfessorInscription < Inscription

  validates :school, presence: true
  validates :school_id, presence: true
  validates :person, presence: true
  validates :medical_data, presence: true

  def name
    "#{person.first_name} #{person.last_name}"
  end

end
