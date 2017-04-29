class SchoolInscriptionsController < ApplicationController

  def new
    @school_inscription = SchoolInscription.new
  end

  def create
    @school_inscription = SchoolInscription.new(school_inscription_params)

    if @school_inscription.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

    def school_inscription_params
      params.require(:school_inscription).permit(permitted_attributes)
    end

    def permitted_attributes
      [
        :name, :phone_number, :email,
        location_attributes: location_attributes
      ]
    end

    def location_attributes
      %i[id province city zip_code street_name street_number details]
    end

end
