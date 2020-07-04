class PartakersMailer < ApplicationMailer
  default from: 'mnubragado@gmail.com'
  helper_method :protect_against_forgery?

  def newsletter_email(partaker)
    @name = partaker.index_name
    @partaker = partaker

    # attachments["Newsletter2019.pdf"] = WickedPdf.new.pdf_from_string(
    #   render_to_string(template: '/partakers/newsletter.pdf.haml', layout: 'application.pdf.haml', locals: {qr: @qr})
    # )
    
    mail(to: @partaker.email, subject: "Para que no nos extrañes... mucho :)")
  end

  def certificate_email(partaker)
    @name = partaker.index_name
    @partaker = partaker

    attachments["#{@partaker.index_name}-Certificado2020.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: '/partakers/certificate.pdf.haml', 
                        layout: 'application.pdf.haml', 
                        locals: {partaker: @partaker}), 
                        { 
                          orientation: "Landscape", 
                          page_size: 'A4', 
                          margin: { top: 0, bottom: 0 , left: 0 , right: 0}
                        },
    )
    
    mail(to: @partaker.email, subject: "Un recordatorio de tu participación")
  end


  def protect_against_forgery?
    false
  end
end
