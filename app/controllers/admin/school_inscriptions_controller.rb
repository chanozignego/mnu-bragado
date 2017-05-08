module Admin
  class SchoolInscriptionsController < Admin::ApplicationController

    def accept
      @school_inscription = SchoolInscription.find(params[:id])
      school = School.new
      school.name = @school_inscription.name
      school.phone_number = @school_inscription.phone_number
      school.fax_number = @school_inscription.fax_number
      school.email = @school_inscription.email
      school.location = @school_inscription.location
      if school.save
        flash[:notice] = "Inscripción aceptada correctamente"
        InscriptionsMailer.approved_inscription_email(@school_inscription.email, "school").deliver_now
        SchoolInscription.find(@school_inscription.id).destroy
        redirect_to admin_school_path(id: school.id)
      else
        flash[:error] = "No se pudo aceptar la inscripción"
        redirect_to admin_school_inscription_path(id: @school_inscription.id)
      end
    end

  end
end