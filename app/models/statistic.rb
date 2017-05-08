class Statistic < ActiveRecord::Base
      
  def persons
    Partaker.count + Professor.count + Trainer.count    
  end

end
