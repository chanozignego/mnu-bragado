require "searchlight/adapters/action_view"

class SchoolSearch < Searchlight::Search
  include Searchable::Base
  include Searchlight::Adapters::ActionView

  def search_name_cont
    opt = options[:name_cont]
    query.where("name ILIKE '%#{opt}%'")
  end

  def search_email_cont
    opt = options[:email_cont]
    query.where("email ILIKE '%#{opt}%'")
  end

  def search_city_cont
    opt = options[:city_cont]
    query.joins(:location).where("city ILIKE '%#{opt}%'")
  end

  def search_street_cont
    opt = options[:street_cont]
    query.joins(:location).where("street_name ILIKE '%#{opt}%' OR street_number ILIKE '%#{opt}%'")
  end

  def search_province_eq
    opt = options[:province_eq]
    query.joins(:location).where("province ILIKE '%#{opt}%'")
  end

end
