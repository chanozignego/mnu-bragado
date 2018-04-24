module Admin
  class ExProfessorsController < Admin::ApplicationController

    def export_to_excel
      @ex_professors = scoped_collection
      respond_to do |format| 
        filename = "ExProfesores-UMBragado.xls"
        column_width = [30, 30, 30, 30, 30, 30, 15]
        header = [["NOMBRE", "APELLIDO", "ESCUELA", "LOCALIDAD", "EMAIL", "TELEFONO", "PAIS"]]
        fields = [:first_name, :last_name, :school_name, :city_name, :email, :phone_number, :year]
        format.xls { send_data(@ex_professors.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    private

      def scoped_collection
        ExProfessor.order(id: :desc)
      end

  end
end