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

    def export_to_excel
      @countries = Country.all
      respond_to do |format| 
        filename = "Paises-UMBragado-#{@current_year}.xls"
        column_width = [25, 25, 25, 25, 10, 10, 10, 10, 10, 10]
        header = [["NOMBRE", "GRUPO REGIONAL", "ESTADO", "ESCUELA ASIGNADA", "AG", "STI", "CS", "G20", "ECOSOC", "TOTAL"]]
        fields = [:name, :regional_group_name, :state_name, :school_name, :ag_translation, :sti_translation, :cs_translation, :g20_translation, :ecosoc_translation, :delegates_quantity]
        format.xls { send_data(@countries.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end


    private

      def resource_collection
        _ = search ? search.results.order(:name) : resource_class.all.order(:name)
        _ = yield(_) if block_given?
        _ = _.page(params[:page]).per(records_per_page)
        _ = decorator_class.decorate_collection(_) if decorator_class?
        _
      end

      def permitted_attributes
        [
          :id, :name, :regional_group, :state, :school, :school_id, 
          :ag, :sti, :cs, :segib, :ecosoc, :g20
        ]
      end

  end
end