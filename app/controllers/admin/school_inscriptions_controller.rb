module Admin
  class SchoolInscriptionsController < Admin::ApplicationController

    def accept
      @school_inscription = SchoolInscription.find(params[:id])
      response, school = InscriptionsService.approve(@school_inscription)
      
      if response
        flash[:notice] = "Inscripción aceptada correctamente"
        redirect_to admin_school_path(id: school.id)
      else
        flash[:error] = "No se pudo aceptar la inscripción"
        redirect_to admin_school_inscription_path(id: @school_inscription.id)
      end
    end

  end
end