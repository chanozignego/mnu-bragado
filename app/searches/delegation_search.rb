require "searchlight/adapters/action_view"

class DelegationSearch < Searchlight::Search
  include Searchable::Base
  include Searchlight::Adapters::ActionView

  def search_countries_name_cont
    opt = options[:countries_name_cont]
    query.joins(:country).where("name ILIKE '%#{opt}%'")
  end

end
