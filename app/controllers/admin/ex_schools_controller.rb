module Admin
  class ExSchoolsController < Admin::ApplicationController

    def export_to_excel
      @ex_schooles = scoped_collection
      respond_to do |format| 
        filename = "ExEscuelas-UMBragado.xls"
        column_width = [30, 30, 30, 30, 15]
        header = [["NOMBRE", "LOCALIDAD", "EMAIL", "TELEFONO", "AÑO"]]
        fields = [:name, :city_name, :email, :phone_number, :year]
        format.xls { send_data(@ex_schooles.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    private

      def scoped_collection
        ExSchool.order(id: :desc)
      end

  end
end