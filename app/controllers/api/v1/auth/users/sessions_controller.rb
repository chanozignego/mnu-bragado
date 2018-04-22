module Api
  module V1
    module Auth
      module Users
        class SessionsController < ActionController::API #ToDo: Change it!!!!

          resource_description do
            name "Users/Sessions"
          end

          api :POST, '/v1/auth/users/sign_in', "Login user"
          param :email, String, required: true      
          param :password, String, required: true      
          param :device_token, String, required: false      
          error :code => 404, :desc => "Page Not Found"
          error :code => 422, :desc => "Unprocessable Entity"
          formats ['json']          
          def create
            user = User.where(email: params[:email]).first
            if user.present?
              user.device_token = params["device-token"]
              user.save
              render_create_success(user)
            else
              render_create_error
            end
          end

          api :DELETE, '/v1/auth/users/sign_out', "Logout user"
          param :id, :number, required: false
          error :code => 404, :desc => "Page Not Found"
          error :code => 422, :desc => "Unprocessable Entity"
          formats ['json']          
          def destroy
            id = request.headers["id"]
            user = User.where(id: id).first
            if user.present?
              user.device_token = nil
              user.save
              render_destroy_success(user)
            else
              render_destroy_error
            end
          end


          protected
            def render_create_success resource
              render json: resource, status: :ok
            end

            def render_create_error
              render json: {success: false, message: "could not find user"}, status: :unprocessable_entity
            end

            def render_destroy_success resource
              render json: {success: true, admin_user: resource}, status: :ok
            end

            def render_destroy_error
              render json: {success: false, message: "could not find user"}, status: :unprocessable_entity
            end
        end
      end
    end
  end
end
