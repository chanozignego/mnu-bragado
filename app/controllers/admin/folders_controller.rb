module Admin
  class FoldersController < Admin::ApplicationController

    def new
      resource = resource_class.new
      resource.abstract_file_id = params[:folder_id]
      render locals: {
        page: Administrate::Page::Form.new(dashboard, resource),
      }
    end

    def destroy
      if requested_resource.destroy
        flash[:notice] = translate_with_resource("destroy.success")
      else
        flash[:error] = translate_with_resource("destroy.error")
      end
      redirect_to :back
    end

  end
end