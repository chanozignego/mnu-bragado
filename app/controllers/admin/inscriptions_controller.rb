module Admin
  class InscriptionsController < Admin::ApplicationController

    def index(locals = {})
      search_term = params[:search].to_s.strip
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resource_collection.order(id: :desc),
        search_term: search_term,
        page: page,
        search: search
      }.merge(locals)
    end

    def export_to_excel
      @inscriptions = Inscription.all
      respond_to do |format| 
        filename = "Inscriptiones-UMBragado-#{@current_year}.xls"
        column_width = [40, 40, 40, 40, 20]
        header = [["ID", "NOMBRE", "TIPO", "ESCUELA", "YA APROBADO"]]
        fields = [:id, :name, :type_name, :school_name, :formatted_already_approved]
        format.xls { send_data(@inscriptions.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    def check_already_approved
      CheckApprovedInscriptionsService.check_approve(Inscription.all)
      redirect_to action: :index
    end

  end
end