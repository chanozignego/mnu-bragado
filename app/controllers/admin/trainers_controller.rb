module Admin
  class TrainersController < Admin::ApplicationController

    def export_to_excel
      @trainers = Trainer.all
      respond_to do |format| 
        filename = "Capacitadores-#{@current_year}.xls"
        column_width = [25, 25, 25, 25, 25, 25, 25, 25, 25]
        header = [["NOMBRE", "APELLIDO", "DNI", "EMAIL", "TELEFONO"]]
        fields = [:first_name, :last_name, :dni, :email, :phone_number]
        format.xls { send_data(@trainers.to_xls(only: fields, header: false, column_width: column_width, prepend: header) , filename: filename) }
      end
    end

    private

      def permitted_attributes
        [
          :id, :facebook_url, :twitter_url, :instagram_url, :rol,
          :principal_image, :secondary_image, :index_number,
          user_attributes: user_attributes
        ]
      end

      def user_attributes
        [
          :id, :first_name, :last_name, :dni, :phone_number, :email, :password
        ]
      end

  end
end