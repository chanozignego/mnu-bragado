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

    namespace :delegates do
      post :check_participation
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users, path: :admin, controllers: {sessions: 'admin/sessions'}

  get "/", controller: "home", action: :index, as: :root

  resource :query

end
