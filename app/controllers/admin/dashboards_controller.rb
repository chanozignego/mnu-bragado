module Admin
  class DashboardsController < Admin::ApplicationController

  	def index
      @statistics = []
      current_year = Date.today.year

      (2013..current_year - 1).each do |year|
        year_statistics = Statistic.where(year: year).first
        delegations = year_statistics.delegations
        partakers = year_statistics.partakers
        delegates = year_statistics.delegates
        authorities = year_statistics.authorities
        statistics = {delegations: delegations, partakers: partakers, delegates: delegates, authorities: authorities, year: year}
        @statistics << statistics
      end

      delegations = Delegation.where(year: current_year).count
      partakers = Partaker.where(year: current_year).count
      delegates = Delegate.where(year: current_year).count
      authorities = Authority.where(year: current_year).count
      statistics = {delegations: delegations, partakers: partakers, delegates: delegates, authorities: authorities, year: current_year}
      @statistics << statistics

      @statistics.reverse!

      super
    end

  end
end