require "searchlight/adapters/action_view"

class AbstractFileSearch < Searchlight::Search
  include Searchable::Base
  include Searchlight::Adapters::ActionView

  def search_name_cont
    opt = options[:name_cont]
    query.where("name ILIKE '%#{opt}%'")
  end

end
