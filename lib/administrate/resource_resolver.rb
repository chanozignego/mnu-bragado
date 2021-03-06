module Administrate
  class ResourceResolver
    def initialize(controller_path)
      @controller_path = controller_path
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

    attr_reader :controller_path
  end
end
