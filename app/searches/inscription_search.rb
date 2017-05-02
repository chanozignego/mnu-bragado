require "searchlight/adapters/action_view"

class InscriptionSearch < Searchlight::Search
  include Searchable::Base
  include Searchlight::Adapters::ActionView

  def search_full_name_cont
    opt = options[:full_name_cont]
    query.joins(:person).where("people.first_name ILIKE '%#{opt}%' OR people.last_name ILIKE '%#{opt}%' OR inscriptions.name ILIKE '%#{opt}%'")
  end

end
