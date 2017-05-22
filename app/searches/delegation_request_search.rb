require "searchlight/adapters/action_view"

class DelegationRequestSearch < Searchlight::Search
  include Searchable::Base
  include Searchlight::Adapters::ActionView


end
