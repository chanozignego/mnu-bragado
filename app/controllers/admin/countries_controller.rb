module Admin
  class CountriesController < Admin::ApplicationController

    private

      def permitted_attributes
        [
          :id, :name
        ]
      end

  end
end