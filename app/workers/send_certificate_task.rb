class SendCertificateTask

  def self.run
    Partaker.all.each do |partaker|
      begin
        PartakersMailer.certificate_email(partaker).deliver_now
        partaker.save!
      rescue StandardError => e
        puts "Error in: @{partaker.id}"
      end
    end
  end


end