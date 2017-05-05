module Admin
  class CountriesController < Admin::ApplicationController

    private

      def permitted_attributes
        [
          :id, :name, :regional_group, :state, :school, :school_id
        ]
      end

  end
end