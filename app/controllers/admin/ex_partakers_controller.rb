module Admin
  class ExPartakersController < Admin::ApplicationController

    def import_from_excel
      if params[:ex_partakers].present? && params[:ex_partakers][:file].present?
        file = params[:ex_partakers][:file]
        
        ExcelImportService.import(file)

        redirect_to action: :index
      else
        redirect_to action: :index
      end
    end

    def export_to_excel
      @ex_partakers = scoped_collection
      respond_to do |format| 
        filename = "ExParticipantes-UMBragado.xls"
        column_width = [25, 25, 25, 25, 25, 25, 25, 25, 25]
        header = [["NOMBRE", "APELLIDO", "DNI", "ESCUELA", "LOCALIDAD", "EMAIL", "TELEFONO", "PAIS", "TIPO", "AÑO"]]
        fields = [:first_name, :last_name, :dni, :school_name, :city_name, :email, :phone_number, :country_name, :partaker_type_name, :year]
        format.xls { send_data(@ex_partakers.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    private

      def scoped_collection
        ExPartaker.order(id: :desc)
      end


  end
end