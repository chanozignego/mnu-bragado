class ProfessorsController < ApplicationController

  def get_by_school
    school_id = params[:school_id]
    text = params[:text]
    professors = []
    query_professors = Professor
      .where(school_id: school_id)
      .joins(:person)
      .where("first_name ILIKE '%#{text}%' OR last_name ILIKE '%#{text}%'")
    query_professors.each do |prof| 
      professors << {id: prof.id, name: prof.full_name}
    end

    render json: professors, status: :ok
  end

end
