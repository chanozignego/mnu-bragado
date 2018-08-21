module Admin
  class PartakersController < Admin::ApplicationController
    self.decorator_class = nil

    def export_to_excel
      generate_excel(scoped_collection, "Participantes")
    end

    def export_with_diet
      partakers = scoped_collection.map{|partaker| partaker if partaker.has_diet?}.compact
      generate_excel(partakers, "ConDieta", [:formatted_is_vegetarian?, :specific_diet_detail], ["VEGETARIANO", "DIETA ESPECÍFICA"])
    end

    def export_with_medical_problems
      partakers = scoped_collection.map{|partaker| partaker if partaker.has_medical_problems?}.compact
      generate_excel(partakers, "ConMedico", [:medical_problems_detail], ["PROBLEMAS MÉDICOS"])
    end

    def generate_excel collection, file_prefix, extra_columns = [], extra_headers = []
      respond_to do |format| 
        filename = "#{file_prefix}-UMBragado-#{@current_year}.xls"
        column_width = [25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25]
        header = [["APELLIDO", "NOMBRE", "DNI", "FECHA NACIMIENTO", "ESCUELA", "LOCALIDAD", "PROVINCIA", "EMAIL", "TELEFONO", "TIPO", "ÓRGANO"].concat(extra_headers)]
        fields = [:last_name, :first_name, :dni, :birthdate, :school_name, :school_location_city, :school_location_province, :email, :phone_number, :type_translation, :rol_translation].concat(extra_columns)
        format.xls { send_data(collection.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    private

      def scoped_collection
        Partaker.where(year: @current_year)
      end

  end
end