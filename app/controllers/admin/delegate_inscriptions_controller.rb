module Admin
  class DelegateInscriptionsController < Admin::ApplicationController

    def accept
      @delegate_inscription = DelegateInscription.find(params[:id])
      response, delegate = InscriptionsService.approve(@delegate_inscription)
      
      if response
        flash[:notice] = "Inscripción aceptada correctamente"
        redirect_to admin_delegate_path(id: delegate.id)
      else
        flash[:error] = "No se pudo aceptar la inscripción"
        redirect_to admin_delegate_inscription_path(id: @delegate_inscription.id)
      end
    end

  end
end