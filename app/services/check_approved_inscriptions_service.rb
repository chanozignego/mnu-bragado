class CheckApprovedInscriptionsService

  def self.check_approve(inscriptions)
    delegate_inscriptions = Inscription.where(type: "DelegateInscription")
    authority_inscriptions = Inscription.where(type: "AuthorityInscription")
    professor_inscriptions = Inscription.where(type: "ProfessorInscription")
    school_inscriptions = Inscription.where(type: "SchoolInscription")

    self.check_delegate_inscriptions_approve(delegate_inscriptions)
    self.check_authority_inscriptions_approve(authority_inscriptions)
    self.check_professor_inscriptions_approve(professor_inscriptions)
    self.check_school_inscriptions_approve(school_inscriptions)

    return true
  end

  private 

    def self.check_person_inscriptions_approve inscriptions, model
      models = model.joins(:person)
      inscriptions.each do |inscription| 
        if ( inscription.person.present? && ( models.where(people: { dni: inscription.person.dni}).present? ||
              ( models.where(people: { first_name: inscription.person.first_name }).present? && 
                models.where(people: { last_name: inscription.person.last_name }).present? ) || 
              models.where(people: { email: inscription.person.email }).present? ) )

          inscription.already_approved = true
          inscription.save

        end
      end
    end 

    def self.check_delegate_inscriptions_approve inscriptions
      self.check_person_inscriptions_approve(inscriptions, Delegate)
    end

    def self.check_authority_inscriptions_approve inscriptions
      self.check_person_inscriptions_approve(inscriptions, Authority)
    end

    def self.check_professor_inscriptions_approve inscriptions
      self.check_person_inscriptions_approve(inscriptions, Professor)
    end

    def self.check_school_inscriptions_approve inscriptions
      inscriptions.each do |inscription| 
        if ( School.where(name: inscription.name).present? ||
             School.where(email: inscription.email).present? ||
             School.where(cue: inscription.cue).present? )
          
          inscription.already_approved = true
          inscription.save!

        end
      end
    end 

end