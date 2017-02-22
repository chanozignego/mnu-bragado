require "searchlight/adapters/action_view"

class AuthoritySearch < Searchlight::Search
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

  # def search_address_cont
  #   condition = ['address_street', 'address_number', 'address_floor'].map do |a|
  #     "#{a} ILIKE '%#{options[:address_cont]}%'"
  #   end.join(" OR ")
  #   query.where(condition)
  # end

  # def search_location_cont
  #   condition = ['state', 'city', 'locality'].map do |a|
  #     "#{a} ILIKE '%#{options[:location_cont]}%'"
  #   end.join(" OR ")
  #   query.where(condition)
  # end

end
