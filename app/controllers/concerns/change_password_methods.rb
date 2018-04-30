module ChangePasswordMethods
  extend ActiveSupport::Concern

  def change_password
    @resource = resource_class.find(params["#{resource_name}_id"])
  end

  def update_password
    @resource = resource_class.find(params["#{resource_name}_id"])
    if @resource.update_attributes(password_attributes)
      redirect_to send("admin_#{resource_name}_path", @resource), notice: I18n.t("backoffice.views.updated_password")
    else
      render :change_password
    end
  end

  private

    def password_attributes
      params[resource_name].permit(:password, :password_confirmation)
    end

end
