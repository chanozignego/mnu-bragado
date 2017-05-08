class SchoolInscriptionsController < ApplicationController

  def new
    @school_inscription = SchoolInscription.new
  end

  def create
    @school_inscription = SchoolInscription.new(school_inscription_params)

    if @school_inscription.save
      begin 
        increment_inscription_counter()
        InscriptionsMailer.school_instructions_email(@school_inscription).deliver_now
      rescue StandardError => e
      end
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

    def increment_inscription_counter
      stats = Statistic.where(year: @current_year).last
      stats.inscriptions = stats.inscriptions + 1
      stats.save
    end

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
