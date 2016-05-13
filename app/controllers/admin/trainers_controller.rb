module Admin
  class TrainersController < Admin::ApplicationController

    private

      def permitted_attributes
        [
          :id, :facebook_url, :twitter_url, :instagram_url, :rol,
          :principal_image, :secondary_image, :index_number
          user_attributes: user_attributes
        ]
      end

      def user_attributes
        [
          :id, :first_name, :last_name, :email, :password
        ]
      end

  end
end