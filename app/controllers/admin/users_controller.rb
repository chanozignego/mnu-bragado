module Admin
  class UsersController < Admin::ApplicationController
    include ChangePasswordMethods

    before_filter :remove_blank_role, only: [:create, :update]

    private
      def permitted_attributes
        [
          :id, :first_name, :last_name, :email, :phone_number, :dni, :password, :password_confirmation, roles: []
        ]
      end

      def remove_blank_role
        if params[:user][:roles].present?
          params[:user][:roles] = params[:user][:roles].reject(&:empty?)
        end
      end
  end
end