module Admin
  class SchoolsController < Admin::ApplicationController

    def export_to_excel
      @schools = School.all
      respond_to do |format| 
        filename = "Escuelas-UMBragado-#{@current_year}.xls"
        column_width = [25, 25, 25, 25, 25, 25, 25, 25, 25]
        header = [["NOMBRE", "PROVINCIA", "CIUDAD", "DIRECCIÓN", "TELEFONO", "EMAIL"]]
        fields = [:name, :location_province, :location_city, :location_street, :phone_number, :email]
        format.xls { send_data(@schools.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    private

      def permitted_attributes
        [
          :id, :name, :key, :phone_number, :email, :inscription_image,
          location_attributes: location_attributes
        ]
      end

      def location_attributes
        %i[id province city zip_code street_name street_number details]
      end
  end
end