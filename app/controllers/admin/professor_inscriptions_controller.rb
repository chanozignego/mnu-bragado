module Admin
  class ProfessorInscriptionsController < Admin::ApplicationController

    def accept
      @professor_inscription = ProfessorInscription.find(params[:id])
      professor = Professor.new
      professor.person = @professor_inscription.person
      professor.medical_data = @professor_inscription.medical_data
      professor.school = @professor_inscription.school
      if professor.save
        flash[:notice] = "Inscripción aceptada correctamente"
        InscriptionsMailer.approved_inscription_email(@professor_inscription.email, "professor").deliver_now
        ProfessorInscription.find(@professor_inscription.id).destroy
        redirect_to admin_professor_path(id: professor.id)
      else
        flash[:error] = "No se pudo aceptar la inscripción"
        redirect_to admin_professor_inscription_path(id: @professor_inscription.id)
      end
    end

  end
end