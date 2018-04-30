module Admin
  class ProfessorInscriptionsController < Admin::ApplicationController

    def accept
      @professor_inscription = ProfessorInscription.find(params[:id])
      response, professor = InscriptionsService.approve(@professor_inscription)

      if response
        flash[:notice] = "Inscripción aceptada correctamente"
        redirect_to admin_professor_path(id: professor.id)
      else
        flash[:error] = "No se pudo aceptar la inscripción"
        redirect_to admin_professor_inscription_path(id: @professor_inscription.id)
      end
    end

  end
end