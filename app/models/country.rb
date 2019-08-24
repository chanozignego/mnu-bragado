class Country < ActiveRecord::Base

  REGIONAL_GROUPS = %i[europe asia africa latam observer nothing]
  STATES = %i[pending assigned]

  enum regional_group: REGIONAL_GROUPS
  enum state: STATES

  belongs_to :school, class_name: "School"

  delegate :name, to: :school, prefix: true, allow_nil: true

  def regional_group_name
  	I18n.t("country.regional_groups")[regional_group.try(:to_sym)]
  end

  def state_name
    I18n.t("country.states")[state.try(:to_sym)]
  end

  def ag_translation
    (ag) ? "SI" : "NO"
  end

  def sti_translation
    (sti) ? "SI" : "NO"
  end

  def cs_translation
    (cs) ? "SI" : "NO"
  end

  def g20_translation
    (g20) ? "SI" : "NO"
  end

  def ecosoc_translation
    (ecosoc) ? "SI" : "NO"
  end

  def delegates_quantity
    quantity = 0
    if (ag) 
      quantity = quantity + 2 
    end
    if (sti) 
      quantity = quantity + 1 
    end
    if (cs) 
      quantity = quantity + 2 
    end
    if (g20) 
      quantity = quantity + 3 
    end
    if (ecosoc) 
      quantity = quantity + 2       
    end
    
    quantity
  end

  def qr_path
    "https://mnubragado.com/qr/#{slug}"
  end

end
