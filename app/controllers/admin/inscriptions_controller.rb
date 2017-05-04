module Admin
  class InscriptionsController < Admin::ApplicationController

    def index(locals = {})
      search_term = params[:search].to_s.strip
      page = Administrate::Page::Collection.new(dashboard, order: order)

      render locals: {
        resources: resource_collection.order(id: :desc),
        search_term: search_term,
        page: page,
        search: search
      }.merge(locals)
    end

  end
end