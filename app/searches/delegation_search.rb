require "searchlight/adapters/action_view"

class DelegationSearch < Searchlight::Search
  include Searchable::Base
  include Searchlight::Adapters::ActionView

  def search_countries_name_cont
    opt = options[:countries_name_cont]
    query.joins(:country).where("name ILIKE '%#{opt}%'")
  end

  def search_country_regional_group_eq
    opt = options[:country_regional_group_eq]
    query.joins(:country).where("regional_group = #{opt}")
  end

end
