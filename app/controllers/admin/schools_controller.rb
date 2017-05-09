module Admin
  class SchoolsController < Admin::ApplicationController


    private

      def permitted_attributes
        [
          :id, :name, :phone_number, :email, :inscription_image,
          location_attributes: location_attributes
        ]
      end

      def location_attributes
        %i[id province city zip_code street_name street_number details]
      end
  end
end