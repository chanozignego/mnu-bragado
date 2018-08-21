class ArchivesController < ApplicationController

  def topics
    @show_folders = params[:folder].present? ? false : true
    @folders = [
                {name: "Asamblea General", section: "ag"},
                {name: "Sala de Tratados", section: "sti"},
                {name: "Consejo de Seguridad", section: "cs"},
                {name: "G20", section: "g20"},
                {name: "ECOSOC", section: "ecosoc"},
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

end
