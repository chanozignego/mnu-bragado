module Api
  module V1
    class UsersController < ActionController::Base

      def inscriptions
        user = User.where(id: params[:id]).first
        if user.present?
          inscriptions = Inscription.order(id: :desc).first(100)
          render json: inscriptions, status: :ok
        else
          render json: {message: "could not find user"}, status: :unprocessable_entity
        end
      end

      def approve_inscription
        user = User.where(id: params[:id]).first
        if user.present?
          inscription = Inscription.where(id: params[:inscription_id]).first
          if inscription.present?
            response, resource = InscriptionsService.approve(inscription)
            if response
              render json: {success: true, resource: resource}, status: :ok
            else
              render json: {success: false, message: "could not approve inscription"}, status: :unprocessable_entity
            end

          else
            render json: {success: false, message: "could not find inscription"}, status: :unprocessable_entity
          end
        else
          render json: {success: false, message: "could not find user"}, status: :unprocessable_entity
        end
      end

    end
  end
end
