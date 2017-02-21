class ExPartaker < ActiveRecord::Base

  TYPES = %i[delegate authority]

  enum partaker_type: TYPES

  def partaker_type_name
    I18n.t('ex_partaker.partaker_types')[partaker_type.try(:to_sym)]
  end 

  def role_name
    I18n.t('ex_partaker.roles')[role.try(:to_sym)]
  end 

  def full_name
    "#{first_name} #{last_name}"
  end

end
