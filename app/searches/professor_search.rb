require "searchlight/adapters/action_view"

class ProfessorSearch < Searchlight::Search
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

end
