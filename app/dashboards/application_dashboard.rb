class ApplicationDashboard < Administrate::BaseDashboard
  class_attribute :excluded_member_actions
  self.excluded_member_actions = []

  def implements_action?(action)
    !excluded_member_actions.include?(action)
  end
end
