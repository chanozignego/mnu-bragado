class HomeController < ApplicationController


  def index
  	@trainers = Trainer.all.order(:index_number)
    render "home/index.html"
  end

end
