module Admin
  class CountriesController < Admin::ApplicationController

    private

      def permitted_attributes
        [
          :id, :name, :regional_group
        ]
      end

  end
end