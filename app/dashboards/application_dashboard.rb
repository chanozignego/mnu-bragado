class ApplicationDashboard < Administrate::BaseDashboard
  class_attribute :excluded_member_actions
  self.excluded_member_actions = []

  ALLOW_MASS_ASSIGNMENT = false
  ALLOW_NOTIFICATIONS = false
  ALLOW_COLLECTION_ACTIONS = false

  PERMISSIONS = { 
                  index: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                  show: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                  edit: [:superadmin, :coordination, :commission],  
                  update: [:superadmin, :coordination, :commission],  
                  destroy: [:superadmin, :coordination, :commission], 
                  create: [:superadmin, :coordination, :commission], 
                  new: [:superadmin, :coordination, :commission], 
                  export_to_excel: [:superadmin, :coordination, :commission, :team_leader, :trainer], 
                  import_from_excel: [:superadmin, :coordination, :commission], 
                  approve: [:superadmin, :coordination, :commission], 
                  accept:  [:superadmin, :coordination, :commission], 
                  check_participation:  [:superadmin, :coordination, :commission], 
                  send_certificates:  [:superadmin, :coordination, :commission], 
                  export_with_diet: [:superadmin, :coordination, :commission], 
                  export_with_medical_problems: [:superadmin, :coordination, :commission], 
                  mass_assignment: [:superadmin, :coordination, :commission], 
                }

  def implements_action?(action)
    !excluded_member_actions.include?(action)
  end

  def self.pending_notifications
    0
  end 

  def self.can? current_user, action
    can = false
    current_user.roles.each do |role|
      aux = self::PERMISSIONS[action.to_sym].include?(role.to_sym)
      can = aux if aux 
    end
    can
  end

  def self.authorize! current_user, action
    ( current_user.present? && action.present? && can?(current_user, action) )
  end

end
