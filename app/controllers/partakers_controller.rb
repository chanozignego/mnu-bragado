class PartakersController < ApplicationController

  def certificate
    @partaker = Partaker.find(params[:id])
    respond_to do |format|
      format.pdf do
        render  pdf: "#{@partaker.index_name}-Certificado2019",
                show_as_html: false, 
                page_size: 'A4', 
                orientation: "Landscape", 
                layout: "application.pdf.haml", 
                margin: { top: 0, bottom: 0 , left: 0 , right: 0}
      end
    end
  end

end
