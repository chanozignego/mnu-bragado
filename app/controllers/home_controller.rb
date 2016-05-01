class HomeController < ApplicationController


  def index
  	@trainers = Trainer.all
    render "home/index.html"
  end

end
