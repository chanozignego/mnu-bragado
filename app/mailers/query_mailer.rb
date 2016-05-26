class QueryMailer < ApplicationMailer

  def new_query_email(query)
    @query = query
    mail(to: "esteban.zignego@gmail.com", subject: 'Nueva Consulta')
  end

end
