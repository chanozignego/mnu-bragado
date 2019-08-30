class SendCertificateTask

  def self.run
    Partaker.last(3).each do |partaker|
      begin
        PartakersMailer.certificate_email(partaker).deliver
        partaker.save!
      rescue StandardError => e
        puts "Error in: @{partaker.id}"
      end
    end
  end


end