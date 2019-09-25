module Admin
  class ProfessorsController < Admin::ApplicationController

    def export_to_excel
      @professors = Professor.all
      respond_to do |format| 
        filename = "Profesores-UMBragado-#{@current_year}.xls"
        column_width = [25, 25, 25, 25, 25, 25, 25, 25, 25]
        header = [["NOMBRE", "APELLIDO", "DNI", "FECHA NACIMIENTO", "EMAIL", "TELEFONO"]]
        fields = [:first_name, :last_name, :dni, :birthdate, :email, :phone_number]
        format.xls { send_data(@professors.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    def send_certificates
      SendCertificateTask.run(Professor)
      redirect_to action: :index
    end

    def send_newsletters
      SendNewsletterTask.run(Professor)
      redirect_to action: :index
    end

    private

      def permitted_attributes
        [
          :id, 
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
  end
end