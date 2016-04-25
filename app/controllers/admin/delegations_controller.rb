module Admin
  class DelegationsController < Admin::ApplicationController
    #self.decorator_class = Admin::DelegateDecorator

    private

      def permitted_attributes
        [
          :id, :country, :sti_delegate_id, :ag_delegate1_id, :ag_delegate2_id, :cs_delegate1_id, :cs_delegate2_id, :segib_delegate1_id, :segib_delegate2_id
        ]
      end

  end
end