class Country < ActiveRecord::Base

  REGIONAL_GROUPS = %i[europe asia africa latam observer nothing]

  enum regional_group: REGIONAL_GROUPS

  def regional_group_name
  	I18n.t("country.regional_groups")[regional_group.try(:to_sym)]
  end

end
