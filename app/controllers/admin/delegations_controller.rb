module Admin
  class DelegationsController < Admin::ApplicationController
    #self.decorator_class = Admin::DelegateDecorator

    private

      def permitted_attributes
        [
          :id, :year, :country_id, :sti_delegate_id, :ag_delegate1_id, :ag_delegate2_id, :cs_delegate1_id, :cs_delegate2_id, :segib_delegate1_id, :segib_delegate2_id
        ]
      end

      def scoped_collection
        Delegation.where(year: @current_year)
      end

  end
end