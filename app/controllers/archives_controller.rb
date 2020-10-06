class ArchivesController < ApplicationController

  def topics
    @show_folders = params[:folder].present? ? false : true
    @folders = [
                {name: "Asamblea General", section: "ag"},
                {name: "Sala de Tratados", section: "sti"},
                {name: "Consejo de Seguridad", section: "cs"},
                {name: "ECOSOC", section: "ecosoc"},
                {name: "ONU Mujeres", section: "onumujeres"},
                {name: "Autoridades", section: "authorities"}
              ]
    @folder_name = params[:folder_name]
    @files = Archive.topic.send(params[:folder]) unless @show_folders
  end

  def schedule
    redirect_to "/img/schedule.pdf"
  end

  def countries
    redirect_to "/img/countries.pdf"
  end

  def concourse
    redirect_to "/img/concourse.pdf"
  end

  def collect
    redirect_to "/img/colecta.pdf"
  end

  def magazine
    redirect_to "/img/revista.pdf"
  end

  def um_folder
    redirect_to "/folder/samples/docs/index.html"
  end

  def photos
    redirect_to "https://www.facebook.com/pg/ModeloNacionesUnidasBragado/photos/?tab=album&album_id=1516690275140574"
  end

  def concourse_pics
    # redirect_to "https://www.facebook.com/pg/ModeloNacionesUnidasBragado/photos/?tab=album&album_id=1516697515139850"
    redirect_to "/img/GanadoresODSabores.pdf"
  end

  def capacitations
    redirect_to "https://www.facebook.com/pg/ModeloNacionesUnidasBragado/photos/?tab=album&album_id=1425863597556576"
  end

  def winners
    redirect_to "/img/ganadores.pdf"
  end

  def collect_data
    redirect_to "/img/colecta.pdf"
  end

  def terms_and_conditions
  end

  def privacy_policy
  end

end
