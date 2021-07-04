class SendCertificateTask

  def self.run klass
    # klass.where(certificate: false).each do |person|
      # begin
        PartakersMailer.certificate_email(Partaker.last).deliver_now
        # person.certificate = true
        # person.save!
      # rescue StandardError => e
      #   puts "Error in: {{person.id}}"
      # end
    #end
  end


end