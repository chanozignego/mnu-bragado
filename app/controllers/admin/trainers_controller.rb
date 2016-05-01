module Admin
  class TrainersController < Admin::ApplicationController
    #self.decorator_class = Admin::DelegateDecorator

    private

      def permitted_attributes
        [
          :id, :facebook_url, :twitter_url, :instagram_url, :rol,
          user_attributes: user_attributes
        ]
      end

      def user_attributes
        [
          :id, :first_name, :last_name, :email
        ]
      end

  end
end