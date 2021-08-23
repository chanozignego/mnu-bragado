class InscriptionsService

  def self.approve(inscription)
    response, resource = send("approve_#{inscription.type.underscore}", inscription)

    if response
      send("approved_#{inscription.type.underscore}_actions", inscription)
    end

    return response, resource
  end

  private 

    def self.approve_authority_inscription inscription
      authority = Authority.new
      authority.person = inscription.person
      authority.medical_data = inscription.medical_data
      authority.professor = inscription.professor
      authority.school = inscription.school
      authority.school_year = inscription.school_year
      authority.orientation = inscription.orientation
      authority.graduated = inscription.graduated
      authority.year = get_current_year
      authority.participated = inscription.participated
      authority.tutors_email = inscription.tutors_email
      authority.presential_activities = inscription.presential_activities
      return authority.save, authority
    end

    def self.approve_delegate_inscription inscription
      delegate = Delegate.new
      delegate.person = inscription.person
      delegate.medical_data = inscription.medical_data
      delegate.professor = inscription.professor
      delegate.school = inscription.school
      delegate.rol = inscription.rol
      delegate.school_year = inscription.school_year
      delegate.orientation = inscription.orientation
      delegate.participated = inscription.participated
      delegate.year = get_current_year
      delegate.tutors_email = inscription.tutors_email
      delegate.presential_activities = inscription.presential_activities
      return delegate.save, delegate
    end

    def self.approve_professor_inscription inscription
      professor = Professor.new
      professor.person = inscription.person
      professor.medical_data = inscription.medical_data
      professor.school = inscription.school
      return professor.save, professor
    end

    def self.approve_school_inscription inscription
      school = School.new
      school.cue = inscription.cue
      school.name = inscription.name
      school.phone_number = inscription.phone_number
      school.fax_number = inscription.fax_number
      school.email = inscription.email
      school.director_name = inscription.director_name
      school.location = inscription.location
      return school.save, school
    end


    def self.approved_authority_inscription_actions inscription
      AuthorityInscription.find(inscription.id).destroy
    end

    def self.approved_delegate_inscription_actions inscription
      DelegateInscription.find(inscription.id).destroy
    end

    def self.approved_professor_inscription_actions inscription
      InscriptionsMailer.approved_inscription_email(inscription.email, "professor").deliver_now
      ProfessorInscription.find(inscription.id).destroy
    end

    def self.approved_school_inscription_actions inscription
      InscriptionsMailer.approved_inscription_email(inscription.email, "school").deliver_now
      SchoolInscription.find(inscription.id).destroy
    end

    def self.get_current_year
      Date.today.year
    end

end