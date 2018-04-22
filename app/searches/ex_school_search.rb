require "searchlight/adapters/action_view"

class ExSchoolSearch < Searchlight::Search
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

end
