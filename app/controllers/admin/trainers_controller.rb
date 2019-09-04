module Admin
  class TrainersController < Admin::ApplicationController

    def export_to_excel
      @trainers = Trainer.all
      respond_to do |format| 
        filename = "Capacitadores-UMBragado-#{@current_year}.xls"
        column_width = [25, 25, 25, 25, 25, 25, 25, 25, 25]
        header = [["NOMBRE", "APELLIDO", "DNI", "EMAIL", "TELEFONO"]]
        fields = [:first_name, :last_name, :dni, :email, :phone_number]
        format.xls { send_data(@trainers.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    def send_certificates
      SendCertificateTask.run(Trainer)
      redirect_to action: :index
    end

    private

      def permitted_attributes
        [
          :id, :facebook_url, :twitter_url, :instagram_url, :rol,
          :principal_image, :secondary_image, :index_number,
          :trainer_from, :university, :career,
          :dni, :birthdate, :age, :blood_type, :rh_factor, 
          :medical_insurance, :medical_insurance_affiliate_number, :medical_insurance_phone_number,
          :emergency_person, :emergency_person_relationship, :emergency_person_phone_number,
          user_attributes: user_attributes,
          person_attributes: person_attributes,
          medical_data_attributes: medical_data_attributes
        ]
      end

      def person_attributes
        [
          :id, :first_name, :last_name, :dni, :birthdate, :age, 
          :phone_number, :email, :blood_type, :rh_factor, 
          :medical_insurance, :medical_insurance_affiliate_number, :medical_insurance_phone_number,
          :emergency_person, :emergency_person_relationship, :emergency_person_phone_number
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

      def user_attributes
        [
          :id, :first_name, :last_name, :dni, :phone_number, :email, :password
        ]
      end

  end
end