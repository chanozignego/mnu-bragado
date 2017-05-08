class InscriptionsMailer < ApplicationMailer
  default from: 'mnubragado@gmail.com'
  helper_method :protect_against_forgery?

  def school_instructions_email(inscription)
    @name = inscription.name
    @school_inscription = inscription

    attachments["Inscripcion#{@school_inscription.name}2017.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: '/school_inscriptions/show.pdf.haml', layout: 'application.pdf.haml')
    )
    
    mail(to: inscription.email, subject: "Bienvenido a MNU Bragado!")
  end

  def professor_instructions_email(inscription)
    @name = inscription.name
    @professor_inscription = inscription

    attachments["Inscripcion#{@professor_inscription.name}2017.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: '/professor_inscriptions/show.pdf.haml', layout: 'application.pdf.haml')
    )
    
    mail(to: inscription.email, subject: "Bienvenido a MNU Bragado!")
  end

  def delegate_instructions_email(inscription)
    @name = inscription.name
    @delegate_inscription = inscription

    attachments["Inscripcion#{@delegate_inscription.name}2017.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: '/delegate_inscriptions/show.pdf.haml', layout: 'application.pdf.haml')
    )
    
    mail(to: inscription.email, subject: "Bienvenido a MNU Bragado!")
  end

  def authority_instructions_email(inscription)
    @name = inscription.name
    @authority_inscription = inscription

    attachments["Inscripcion#{@authority_inscription.name}2017.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(template: '/authority_inscriptions/show.pdf.haml', layout: 'application.pdf.haml')
    )
    
    mail(to: inscription.email, subject: "Bienvenido a MNU Bragado!")
  end

  def approved_inscription_email(email, inscription_type)
    @inscription_type = inscription_type
    mail(to: email, subject: "Inscripción aceptada!")
  end

  def protect_against_forgery?
    false
  end
end
