module Admin
  class FoldersController < Admin::ApplicationController

    def new
      resource = resource_class.new
      resource.abstract_file_id = params[:folder_id]
      render locals: {
        page: Administrate::Page::Form.new(dashboard, resource),
      }
    end

  end
end