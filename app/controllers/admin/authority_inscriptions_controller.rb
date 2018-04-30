module Admin
  class AuthorityInscriptionsController < Admin::ApplicationController

    def accept
      @authority_inscription = AuthorityInscription.find(params[:id])
      response, authority = InscriptionsService.approve(@authority_inscription)
      if response
        flash[:notice] = "Inscripción aceptada correctamente"
        redirect_to admin_authority_path(id: authority.id)
      else
        flash[:error] = "No se pudo aceptar la inscripción"
        redirect_to admin_authority_inscription_path(id: @authority_inscription.id)
      end
    end

  end
end