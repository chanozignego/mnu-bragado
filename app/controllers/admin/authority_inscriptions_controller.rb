module Admin
  class AuthorityInscriptionsController < Admin::ApplicationController

    def accept
      @authority_inscription = AuthorityInscription.find(params[:id])
      authority = Authority.new
      authority.person = @authority_inscription.person
      authority.medical_data = @authority_inscription.medical_data
      authority.professor = @authority_inscription.professor
      authority.school = @authority_inscription.school
      authority.year = @current_year
      authority.participated = @authority_inscription.participated
      if authority.save
        flash[:notice] = "Inscripción aceptada correctamente"
        AuthorityInscription.find(@authority_inscription.id).destroy
        redirect_to admin_authority_path(id: authority.id)
      else
        flash[:error] = "No se pudo aceptar la inscripción"
        redirect_to admin_authority_inscription_path(id: @authority_inscription.id)
      end
    end

  end
end