module Admin
  class AbstractFilesController < Admin::ApplicationController

    def index(locals = {})
      search_term = params[:search].to_s.strip
      page = Administrate::Page::Collection.new(dashboard, order: order)

      @folder_id = params[:id]
      if @folder_id.present? 
        file = AbstractFile.find(@folder_id)
        @breadcrumbs = file.full_name
      end

      render locals: {
        resources: resource_collection,
        search_term: search_term,
        page: page,
        search: search
      }.merge(locals)
    end

    def new
      resource = resource_class.new
      if params[:folder_id].present?
        abstract_file = AbstractFile.find params[:folder_id]
        resource.abstract_file_id = params[:folder_id]
        resource.classification = abstract_file.classification
        resource.archive_type = abstract_file.archive_type
      end
      resource.type = params[:type]
      resource.file_type = :folder if params[:type] == "Folder" 

      render locals: {
        page: Administrate::Page::Form.new(dashboard, resource),
      }
    end

    def create
      resource = resource_class.new(resource_params)

      if resource.save
        redirect_to(admin_abstract_files_path(id: resource.abstract_file_id),
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, resource),
        }
      end
    end

    private

      def resources
        if params[:id].present?
          folder = AbstractFile.find(params[:id])
          folder.abstract_files
        else
          AbstractFile.where(folder: nil)
        end
      end

      def resource_collection
        # _ = search ? search.results.order(id: :desc) : resources.order(id: :desc)
        _ = search ? resources.order(id: :desc) : resources.order(id: :desc)
        _ = yield(_) if block_given?
        _ = _.page(params[:page]).per(records_per_page)
        _ = decorator_class.decorate_collection(_) if decorator_class?
        _
      end

  end
end