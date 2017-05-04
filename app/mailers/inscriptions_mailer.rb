class InscriptionsMailer < ApplicationMailer
  #default from: 'mnubragado@gmail.com'

  def school_instructions_email(email, name)
    @name = name
    mail(to: email, subject: "Bienvenido a MNU Bragado!")
  end

  def professor_instructions_email(email, name)
    @name = name
    mail(to: email, subject: "Bienvenido a MNU Bragado!")
  end

  def delegate_instructions_email(email, name)
    @name = name
    mail(to: email, subject: "Bienvenido a MNU Bragado!")
  end

  def authority_instructions_email(email, name)
    @name = name
    mail(to: email, subject: "Bienvenido a MNU Bragado!")
  end
end
