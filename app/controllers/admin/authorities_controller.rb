module Admin
  class AuthoritiesController < Admin::ApplicationController

    def export_to_excel
      @authorities = scoped_collection
      respond_to do |format| 
        filename = "Autoridades-UMBragado-#{@current_year}.xls"
        column_width = [25, 25, 25, 25, 25, 25, 25, 25, 25]
        header = [["NOMBRE", "APELLIDO", "DNI", "FECHA NACIMIENTO", "ESCUELA", "LOCALIDAD", "PROVINCIA", "EMAIL", "TELEFONO"]]
        fields = [:first_name, :last_name, :dni, :birthdate, :school_name, :school_location_city, :school_location_province, :email, :phone_number]
        format.xls { send_data(@authorities.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    private

      def permitted_attributes
        [
          :id, :year, :rol, :school_id, :professor_id,
          :school_year, :orientation,
          person_attributes: person_attributes,
          medical_data_attributes: medical_data_attributes
        ]
      end

      def person_attributes
        [
          :id, :first_name, :last_name, :dni, :birthdate, :age, 
          :phone_number, :email, :blood_type, :rh_factor, 
          :medical_insurance, :medical_insurance_affiliate_number, :medical_insurance_phone_number,
          :emergency_person, :emergency_person_relationship, :emergency_person_phone_number,
          location_attributes: location_attributes
        ]
      end

      def medical_data_attributes
        [
          :id, :has_chronic_desease, :chronic_desease_detail, :take_medication, 
          :medication_detail, :has_medical_background, :medical_background_detail, 
          :has_allergy, :allergy_detail, :has_specific_diet, :specific_diet_detail, 
          :is_vegetarian, :doctor_name, :doctor_phone_number, :urgency_clinic
        ]
      end

      def location_attributes
        %i[id province city zip_code street_name street_number details]
      end

      def scoped_collection
        Authority.where(year: @current_year)
      end
  end
end