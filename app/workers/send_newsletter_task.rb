class SendNewsletterTask

  def self.run klass
    klass.where(newsletter: false).each do |person|
      begin
        PartakersMailer.newsletter_email(person).deliver
        person.newsletter = true
        person.save!
      rescue StandardError => e
        puts "Error in: @{person.id}"
      end
    end
  end


end