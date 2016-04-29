class CheckParticipationTask

  def self.run
    Delegate.not_participated.each do |delegate|
      count = Partaker.joins(:person).where(people: {dni: delegate.person.try(:dni)}).count
      if count < 1
        delegate.update(participated: true)
      end
    end
  end


end