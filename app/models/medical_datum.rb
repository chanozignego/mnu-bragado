class MedicalDatum < ActiveRecord::Base

  def has_diet?
    get_boolean_value(%i[has_specific_diet is_vegetarian])
  end

  def has_medical_problems?
    get_boolean_value(%i[has_chronic_desease take_medication has_medical_background has_allergy])
  end

  private

    def get_boolean_value fields
      fields.each do |field|
        return true if self.send(field)
      end
      return false
    end

end
