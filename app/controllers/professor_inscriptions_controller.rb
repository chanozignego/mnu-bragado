class ProfessorInscriptionsController < ApplicationController

  def new
    @professor_inscription = ProfessorInscription.new
  end

  def create
    resource = ProfessorInscription.new(professor_inscription_params)

    if resource.save
      redirect_to root_path
    end
  end

  private

    def professor_inscription_params
      params.require(:professor_inscription).permit(permitted_attributes)
    end

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