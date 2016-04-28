module Admin
  class DashboardsController < Admin::ApplicationController

  	def index
      @statistics = []
      current_year = Date.today.year

      (2013..current_year).each do |year|
        delegations = Delegation.where(year: year).count
        partakers = Partaker.where(year: year).count
        delegates = Delegate.where(year: year).count
        authorities = Authority.where(year: year).count
        year_statistics = {delegations: delegations, partakers: partakers, delegates: delegates, authorities: authorities, year: year}
        @statistics << year_statistics
      end
      @statistics.reverse!

      super
    end

  end
end