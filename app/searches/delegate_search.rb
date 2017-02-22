require "searchlight/adapters/action_view"

class DelegateSearch < Searchlight::Search
  include Searchable::Base
  include Searchlight::Adapters::ActionView

  def search_full_name_cont
    opt = options[:full_name_cont]
    query.joins(:person).where("first_name ILIKE '%#{opt}%' OR last_name ILIKE '%#{opt}%'")
  end

  def search_email_cont
    opt = options[:email_cont]
    query.joins(:person).where("email ILIKE '%#{opt}%'")
  end

  def search_dni_cont
    opt = options[:dni_cont]
    query.joins(:person).where("dni ILIKE '%#{opt}%'")
  end

  def search_has_diet_eq
    opt = options[:has_diet_eq]

    diet_conditions = ['is_vegetarian', 'has_specific_diet']

    if (opt == "true")
      opt = true
      condition = diet_conditions.map do |a|
        "#{a} = #{opt}"
      end.join(" OR ")
    else
      opt = false
      condition = diet_conditions.map do |a|
        "#{a} = #{opt}"
      end.join(" AND ")
    end
    query.joins(:medical_data).where(condition)
  end

  def search_has_medical_problems_eq
    opt = options[:has_medical_problems_eq]

    medical_problems = ['has_chronic_desease', 'take_medication', 'has_medical_background', 'has_allergy']

    if (opt == "true")
      opt = true
      condition = medical_problems.map do |a|
        "#{a} = #{opt}"
      end.join(" OR ")
    else
      opt = false
      condition = medical_problems.map do |a|
        "#{a} = #{opt}"
      end.join(" AND ")
    end
    query.joins(:medical_data).where(condition)
  end

end
