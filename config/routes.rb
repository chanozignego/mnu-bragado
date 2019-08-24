Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |resource_name|
      dashboard = DashboardManifest.get_dashboard(resource_name)

      route_options = { except: dashboard.excluded_member_actions }

      #Mass Assigment routes
      if resource_name =~ /\//
        ns, res_name = resource_name.split '/'
        namespace ns do
          namespace res_name do
            post :mass_assignment
          end
        end
      else
        namespace resource_name do
          post :mass_assignment
        end
      end


      route_config_block = -> do

        member do
          dashboard::MEMBER_ACTIONS.each do |action|
            public_send(
              action.fetch(:http_method),
              action.fetch(:name)
            )
          end if dashboard.const_defined?("MEMBER_ACTIONS")
        end

        # collection do 
        #   dashboard::COLLECTION_ACTIONS.each do |action|
        #     #public_send(
        #     #  action.fetch(:http_method),
        #     #  action.fetch(:name)
        #     #)
        #   end if dashboard::ALLOW_COLLECTION_ACTIONS
        # end
        
      end

      DashboardManifest::DASHBOARDS.each do |resource_name|
        if resource_name =~ /\//
          ns, res_name = resource_name.split '/'
          namespace ns do
            resources res_name, route_options, &route_config_block
          end
        else
          resources resource_name, route_options, &route_config_block
        end
      end
    end

    resources :partaker_inscriptions do
      member do
        put :accept
      end
    end
    resources :authority_inscriptions do
      member do
        put :accept
      end
    end
    resources :delegate_inscriptions do
      member do
        put :accept
      end
    end
    resources :school_inscriptions do
      member do
        put :accept
      end
    end
    resources :professor_inscriptions do
      member do
        put :accept
      end
    end

    #REFACTOR THIS!!!!!!!!!!!!!!!
    namespace :delegates do
      post :check_participation
      post :export_to_excel
    end

    namespace :authorities do
      post :export_to_excel
    end

    namespace :delegations do
      post :export_to_excel
    end

    namespace :trainers do
      post :export_to_excel
    end

    namespace :professors do
      post :export_to_excel
    end

    namespace :schools do
      post :export_to_excel
    end

    namespace :inscriptions do
      post :export_to_excel
      post :check_already_approved
    end

    namespace :partakers do
      post :export_to_excel
      post :export_with_diet
      post :export_with_medical_problems
    end

    namespace :ex_partakers do
      post :import_from_excel
      post :export_to_excel
    end

    namespace :ex_schools do
      post :export_to_excel
    end

    namespace :ex_professors do
      post :export_to_excel
    end

    namespace :countries do
      post :export_to_excel
      post :import_from_excel
    end

    resources :users, only: [] do
      get :change_password
      put :update_password
    end

    resources :folders, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :archives, only: [:index, :show, :new, :create, :edit, :update, :destroy]

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users, path: :admin, controllers: {sessions: 'admin/sessions'}




  # FRONT END
  get "/", controller: "home", action: :index, as: :root

  get "/inscriptions", controller: "inscriptions", action: :index
  get "/open_data", controller: "open_data", action: :index
  get "/imagenes/qr", controller: "country_pictures", action: :new
  get "/qr/:id", controller: "country_pictures", action: :show
  get "/revista", controller: "archives", action: :magazine
  resources :delegate_inscriptions do
    member do
      get :accepted
    end
  end
  resources :authority_inscriptions do
    member do
      get :accepted
    end
  end
  resources :professor_inscriptions do
    member do
      get :accepted
    end
  end
  resources :school_inscriptions do
    member do
      get :accepted
    end
  end
  resource :professors do 
    collection do
      get :get_by_school
    end
  end
  resources :partakers do 
    member do
      get :certificate
    end
  end

  resources :country_pictures do 
  end

  resources :folders
  resources :archives do
    collection do
      get :topics
      get :schedule
      get :countries
      get :concourse
      get :collect
      get :magazine
    end
  end
  resource :query


  # # API
  # devise_scope :users do
  #   post "/api/v1/auth/users/sign_in", to: "api/v1/auth/users/sessions#create"
  #   delete "/api/v1/auth/users/sign_out", to: "api/v1/auth/users/sessions#destroy"
  # end

  post "/api/v1/auth/users/sign_in", to: "api/v1/auth/users/sessions#create"
  delete "/api/v1/auth/users/sign_out", to: "api/v1/auth/users/sessions#destroy"

  namespace :api do

    namespace :v1 do

      resources :users, only: [:show] do
        member do
          get :inscriptions
          post :approve_inscription
        end
      end


    end

  end

end
