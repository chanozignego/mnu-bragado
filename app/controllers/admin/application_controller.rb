# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    prepend_before_filter :authenticate_user!
    before_filter :authenticate_admin
    before_filter :set_current_year

    helper Admin::ApplicationHelper
    helper_method :current_dashboard
    delegate :dashboard_class, :current_controller_name, :controller_path_name, to: :resource_resolver
    helper_method :resource_class, :dashboard_class, :dashboard, :current_controller_name, :controller_path_name

    #include MassAssigmentLogic

    class_attribute :decorator_class

    def index(locals = {})
      search_term = params[:search].to_s.strip
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resource_collection,
        search_term: search_term,
        page: page,
        search: search
      }.merge(locals)
    end

    # def create
    #   resource = resource_class.new(resource_params)

    #   if decorator_class?
    #     resource = decorator_class.decorate(resource)
    #   end

    #   if resource.save
    #     after_resource_create_success(resource)
    #   else
    #     after_resource_create_error(resource)
    #   end
    # end

    # def destroy
    #   if requested_resource.destroy
    #     after_resource_destroy_success
    #   end
    # end

    def set_current_year
      @current_year = Date.today.year
    end

    def dashboard_class
      Object.const_get(resource_class_name + "Dashboard")
    end

    def namespace
      controller_path.split("/").first
    end

    def resource_class
      Object.const_get(resource_class_name)
    end

    def resource_name
      model_path_parts.map(&:underscore).join("_").to_sym
    end

    def resource_title
      model_path_parts.join(" ")
    end

    def controller_path_name
      current_controller_name.gsub("/", "_")
    end

    def current_controller_name
      resource_class.name.underscore.pluralize
    end 

    def current_dashboard
      dashboard_class
      #{}"#{controllers_model_name}Dashboard".safe_constantize
    end

    private

    def resource_class_name
      model_path_parts.join("::")
    end

    def model_path_parts
      controller_path_parts.map(&:camelize)
    end

    def controller_path_parts
      controller_path.singularize.split("/")[1..-1]
    end

    def current_user
      super #&& UserDecorator.decorate(super)
    end

    # def after_resource_destroy_success
    #   flash[:notice] = translate_with_resource("destroy.success")
    #   redirect_to action: :index
    # end

    # def after_resource_create_success(resource)
    #   redirect_to(
    #     [namespace, resource],
    #     notice: translate_with_resource("create.success"),
    #   )
    # end

    # def after_resource_create_error(resource)
    #   render :new, locals: {
    #     page: Administrate::Page::Form.new(dashboard, resource)
    #   }
    # end

    # def handle_resource_update
    #   if yield
    #     after_resource_update_success
    #   else
    #     after_resource_update_error
    #   end
    # end

    # def after_resource_update_success
    #   redirect_to(
    #     [namespace, requested_resource],
    #     notice: translate_with_resource("update.success"),
    #   )
    # end

    # def after_resource_update_error
    #   render :edit, locals: {
    #     notice: translate_with_resource("update.error"),
    #     page: Administrate::Page::Form.new(dashboard, requested_resource)
    #   }
    # end

    def current_search
      "#{resource_class.name}Search".safe_constantize
    end

    def authenticate_admin
      current_user #&& current_user.is_admin?
    end

    def records_per_page
      params[:per_page] || 20
    end

    def search
      return unless current_search
      current_search.new(search_params)
    end

    def search_params
      params[:"#{resource_name}_search"] || {}
    end

    def requested_resource
      decorator_class.present? ? decorator_class.decorate(super) : super
    end

    def resource_collection
      _ = search ? search.results : resource_class.all
      _ = yield(_) if block_given?
      _ = _.page(params[:page]).per(records_per_page)
      _ = decorator_class.decorate_collection(_) if decorator_class?
      _
    end
  end
end
