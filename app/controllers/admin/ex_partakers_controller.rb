module Admin
  class ExPartakersController < Admin::ApplicationController

    def import_from_excel
      if params[:ex_partakers].present? && params[:ex_partakers][:file].present?
        file = params[:ex_partakers][:file]
        
        ExcelImportService.import(file)

        redirect_to action: :index
      else
        redirect_to action: :index
      end
    end

  end
end