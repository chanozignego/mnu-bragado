class ApplicationDashboard < Administrate::BaseDashboard
  class_attribute :excluded_member_actions
  self.excluded_member_actions = []

  ALLOW_NOTIFICATIONS = false

  def implements_action?(action)
    !excluded_member_actions.include?(action)
  end

  def self.pending_notifications
    0
  end 

end
