class MedicalDatum < ActiveRecord::Base

  def has_diet?
    get_boolean_value(%i[has_specific_diet is_vegetarian])
  end

  def has_medical_problems?
    get_boolean_value(%i[has_chronic_desease take_medication has_medical_background has_allergy])
  end

  def medical_problems_detail
    medical_problems = ""
    medical_problems += "| Enf. Crónicas: SI ( #{chronic_desease_detail} ) |" if has_chronic_desease
    medical_problems += "| Toma medicación: SI ( #{medication_detail} ) |" if take_medication
    medical_problems += "| Antecedentes: SI ( #{medical_background_detail} ) | " if take_medication
    medical_problems += "| Alergias: SI ( #{allergy_detail} ) |" if take_medication
    medical_problems
  end

  private

    def get_boolean_value fields
      fields.each do |field|
        return true if self.send(field)
      end
      return false
    end

end
