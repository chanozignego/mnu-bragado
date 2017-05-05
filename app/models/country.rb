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

end
