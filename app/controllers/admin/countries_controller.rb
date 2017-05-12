module Admin
  class CountriesController < Admin::ApplicationController

    def index(locals = {})
      search_term = params[:search].to_s.strip
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resource_collection.order(:name),
        search_term: search_term,
        page: page,
        search: search
      }.merge(locals)
    end

    def import_from_excel
      if params[:countries].present? && params[:countries][:file].present?
        file = params[:countries][:file]
        
        ExcelImportService.import_countries(file)

        redirect_to action: :index
      else
        redirect_to action: :index
      end
    end


    private

      def permitted_attributes
        [
          :id, :name, :regional_group, :state, :school, :school_id, 
          :ag, :sti, :cs, :segib, :ecosoc
        ]
      end

  end
end