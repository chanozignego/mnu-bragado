module Admin
  class CountriesController < Admin::ApplicationController

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