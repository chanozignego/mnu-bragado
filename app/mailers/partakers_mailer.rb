class PartakersMailer < ApplicationMailer
  default from: 'mnubragado@gmail.com'
  helper_method :protect_against_forgery?

  def newsletter_email(partaker)
    @name = partaker.index_name
    @partaker = partaker

    # attachments["Newsletter2019.pdf"] = WickedPdf.new.pdf_from_string(
    #   render_to_string(template: '/partakers/newsletter.pdf.haml', layout: 'application.pdf.haml', locals: {qr: @qr})
    # )
    
    mail(to: @partaker.email, subject: "No te pierdas nada!!")
  end

  def protect_against_forgery?
    false
  end
end
