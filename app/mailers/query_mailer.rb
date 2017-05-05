class QueryMailer < ApplicationMailer
  default from: "consultas@mnubragado.com"

  def new_query_email(query)
    @query = query
    mail(to: "mnubragado@gmail.com", subject: 'Nueva Consulta')
  end

end
