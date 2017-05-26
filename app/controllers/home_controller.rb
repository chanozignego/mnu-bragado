class HomeController < ApplicationController


  def index
  	@trainers = Trainer.all.order(:index_number)
    @sections = Folder.where(folder: nil)
    render "home/index.html"
  end

end
