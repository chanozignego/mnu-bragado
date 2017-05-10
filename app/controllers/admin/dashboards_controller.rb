module Admin
  class DashboardsController < Admin::ApplicationController

  	def index
      @statistics = []
      @chart_statistics = []
      current_year = Date.today.year

      (2014..current_year - 1).each do |year|
        year_statistics = Statistic.where(year: year).first
        delegations = year_statistics.delegations
        partakers = year_statistics.partakers
        delegates = year_statistics.delegates
        authorities = year_statistics.authorities
        statistics = {delegations: delegations, partakers: partakers, delegates: delegates, authorities: authorities, year: year}
        @chart_statistics << [year, partakers, delegations, delegates, authorities]
        @statistics << statistics
      end

      delegations = Delegation.where(year: current_year).count
      partakers = Partaker.where(year: current_year).count
      delegates = Delegate.where(year: current_year).count
      authorities = Authority.where(year: current_year).count
      professors = Professor.count
      schools = School.count
      statistics = {delegations: delegations, partakers: partakers, delegates: delegates, authorities: authorities, professors: professors, schools: schools, year: current_year}
      @chart_statistics << [current_year, partakers, delegations, delegates, authorities]
      @statistics << statistics

      @statistics.reverse!

      @model_data = {}
      @model_data[:views] = Statistic.where(year: current_year).last.try(:views) || 0
      @model_data[:inscriptions] = Statistic.where(year: current_year).last.try(:inscriptions) || 0
      @model_data[:queries] = Statistic.where(year: current_year).last.try(:queries) || 0
      @model_data[:persons] = Statistic.where(year: current_year).last.try(:persons) || 0

      super
    end

  end
end