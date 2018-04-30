module Api
  module V1
    class InscriptionsController < ActionController::Base

      def index
        # admin = AdminUser.where(id: params[:id]).first
        # if admin.present?
        #   shipments = Shipment.order(id: :desc).first(100)
        #   render json: shipments, status: :ok
        # else
        #   render json: {message: "could not find admin user"}, status: :unprocessable_entity
        # end
      end

      def aprobe
        # admin = AdminUser.where(id: params[:id]).first
        # if admin.present?
        #   user = User.find(params[:user_id])
        #   checking_account = CheckingAccount.new(owner: user, 
        #                                           checking_account_type: :user, 
        #                                           billing_scheme: BillingScheme.first)
        #   if checking_account.save
        #     render json: {success: true, user: user}, status: :ok
        #   else
        #     render json: {success: false, message: "could not create checking account"}, status: :unprocessable_entity
        #   end
        # else
        #   render json: {success: false, message: "could not find admin user"}, status: :unprocessable_entity
        # end
      end

    end
  end
end
