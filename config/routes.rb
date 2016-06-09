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

    #REFACTOR THIS!!!!!!!!!!!!!!!
    namespace :delegates do
      post :check_participation
      post :export_to_excel
    end

    namespace :authorities do
      post :export_to_excel
    end

    namespace :trainers do
      post :export_to_excel
    end

    namespace :professors do
      post :export_to_excel
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users, path: :admin, controllers: {sessions: 'admin/sessions'}

  get "/", controller: "home", action: :index, as: :root

  resource :query

end
