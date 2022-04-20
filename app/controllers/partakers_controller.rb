class PartakersController < ApplicationController

  def send_certificate
    @partaker = Partaker.find(params[:id])
    begin
      PartakersMailer.newsletter_email(@partaker).deliver_now
      @partaker.newsletter = true
      @partaker.save!
    rescue StandardError => e
    end
    redirect_to action: :accepted, id: @partaker.id
  end

  def certificate
    @partaker = Partaker.find(params[:id])
    respond_to do |format|
      format.pdf do
        render  pdf: "#{@partaker.index_name}-Certificado2022",
                show_as_html: false, 
                page_size: 'A4', 
                orientation: "Landscape", 
                layout: "application.pdf.haml", 
                margin: { top: 0, bottom: 0 , left: 0 , right: 0}
      end
    end
  end

  def newsletter
    @partaker = Partaker.find(params[:id])

    begin
      PartakersMailer.newsletter_email(@partaker).deliver_now
      @partaker.newsletter = true
      @partaker.save!
    rescue StandardError => e
    end
    redirect_to action: :accepted, id: @partaker.id
  end

  def newsletter
    @partaker = Partaker.find(params[:id])
    respond_to do |format|
      format.pdf do
        render  pdf: "#{@partaker.index_name}-Certificado2022",
                show_as_html: false, 
                page_size: 'A4', 
                orientation: "Landscape", 
                layout: "application.pdf.haml", 
                margin: { top: 0, bottom: 0 , left: 0 , right: 0}
      end
    end
  end

end
