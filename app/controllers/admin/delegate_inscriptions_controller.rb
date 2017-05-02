module Admin
  class DelegateInscriptionsController < Admin::ApplicationController

    def accept
      @delegate_inscription = DelegateInscription.find(params[:id])
      delegate = Delegate.new
      delegate.person = @delegate_inscription.person
      delegate.medical_data = @delegate_inscription.medical_data
      delegate.professor = @delegate_inscription.professor
      delegate.school = @delegate_inscription.school
      delegate.rol = @delegate_inscription.rol
      delegate.participated = @delegate_inscription.participated
      delegate.year = @current_year
      if delegate.save
        flash[:notice] = "Inscripción aceptada correctamente"
        DelegateInscription.find(@delegate_inscription.id).destroy
        redirect_to admin_delegate_path(id: delegate.id)
      else
        flash[:error] = "No se pudo aceptar la inscripción"
        redirect_to admin_delegate_inscription_path(id: @delegate_inscription.id)
      end
    end

  end
end