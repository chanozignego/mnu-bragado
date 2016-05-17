module Admin
  class QueriesController < Admin::ApplicationController

    def show
      requested_resource.update(already_read: true) unless requested_resource.already_read
      super
    end

  end
end