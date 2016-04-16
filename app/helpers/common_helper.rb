module CommonHelper
  def notify_type_for_flash flash_type
    types = {notice: :success, alert: :warning, error: :danger}.with_indifferent_access
    types[flash_type].presence || :info
  end
  
  def active_sidebar name
    (params[:active_sidebar].to_s == name.to_s || controller_name.to_s == name.to_s) ? :active : "" 
  end

  def is_property_type? type
    Property::TYPES.include?(type.to_s)
  end

  def is_choice_type? type
    Choice::TYPES.include?(type.to_s)
  end

  def object_class entity
    return unless entity.present?
    entity.is_a?(Draper::Decorator) ? entity.object.class : entity.class    
  end

  def non_formatted_method method_name
    method_name.to_s.gsub("formatted_", "").to_sym
  end

  def submit_entity_label entity, options={}
    options = options.with_indifferent_access
    key = entity.new_record? ? "administrate.actions.new_entity" : "administrate.actions.edit_entity"
    entity_name = options[:entity_name].presence || entity.class.model_name.human
    I18n.t(key, entity: entity_name)
  end
end
