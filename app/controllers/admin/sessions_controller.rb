class Admin::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(admin_user)
    admin_root_path
  end
end