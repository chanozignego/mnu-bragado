class SendCertificateTask

  def self.run klass
    klass.where(certificate: false).each do |person|
      begin
        PartakersMailer.certificate_email(person).deliver
        person.certificate = true
        person.save!
      rescue StandardError => e
        puts "Error in: @{person.id}"
      end
    end
  end


end