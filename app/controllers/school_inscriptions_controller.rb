class SchoolInscriptionsController < ApplicationController

  def new
    @school_inscription = SchoolInscription.new
  end

  def create
    @school_inscription = SchoolInscription.new(school_inscription_params)

    if @school_inscription.save
      #InscriptionsMailer.school_instructions_email(@school_inscription.email, @school_inscription.name).deliver_now
      redirect_to action: :accepted, id: @school_inscription.id
    else
      render :new
    end
  end

  def show
    @school_inscription = SchoolInscription.find(params[:id])
    respond_to do |format|
      format.pdf do
        render  pdf: "#{@school_inscription.name}-Inscripcion2017", show_as_html: false, layout: "application.pdf.haml"
      end
    end
  end

  def accepted
    @school_inscription = SchoolInscription.find(params[:id])
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
