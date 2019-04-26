class OpenDataController < ApplicationController

  def index
    @statistics = []
    @chart_statistics = []
    current_year = Date.today.year

    (2014..current_year - 1).each do |year|
      year_statistics = Statistic.where(year: year).first
      delegations = year_statistics.delegations || 0
      partakers = year_statistics.partakers || 0
      delegates = year_statistics.delegates || 0
      authorities = year_statistics.authorities || 0
      professors = ExProfessor.where(year: year).count || 0
      schools = ExSchool.where(year: year).count || 0
      statistics = {delegations: delegations, partakers: partakers, delegates: delegates, authorities: authorities, schools: schools, professors: professors, year: year}
      @chart_statistics << [year, partakers, delegations, delegates, authorities]
      @statistics << statistics
    end

    delegations = Delegation.where(year: current_year).count || 0
    partakers = Partaker.where(year: current_year).count || 0
    delegates = Delegate.where(year: current_year).count || 0
    authorities = Authority.where(year: current_year).count || 0
    professors = Professor.count || 0
    schools = School.count || 0
    @current_year_statistics = {delegations: delegations, partakers: partakers, delegates: delegates, authorities: authorities, professors: professors, schools: schools, year: current_year}

    if (@current_year_statistics[:partakers] != 0)
      @chart_statistics << [current_year, partakers, delegations, delegates, authorities]
      @statistics << @current_year_statistics
    end

    @statistics.reverse!

    @all_years_statistics = {
      delegations: @statistics.map {|s| s[:delegations]}.reduce(0, :+), 
      partakers: @statistics.map {|s| s[:partakers]}.reduce(0, :+), 
      delegates: @statistics.map {|s| s[:delegates]}.reduce(0, :+), 
      authorities: @statistics.map {|s| s[:authorities]}.reduce(0, :+), 
      professors: @statistics.map {|s| s[:professors]}.reduce(0, :+), 
      schools: @statistics.map {|s| s[:schools]}.reduce(0, :+), 
    }

    @model_data = {}
    @model_data[:views] = Statistic.where(year: current_year).last.try(:views) || 0
    @model_data[:inscriptions] = Statistic.where(year: current_year).last.try(:inscriptions) || 0
    @model_data[:queries] = Statistic.where(year: current_year).last.try(:queries) || 0
    @model_data[:persons] = Statistic.where(year: current_year).last.try(:persons) || 0

    @schools = []
    @schools << School.all.map(&:name)
    @schools << ExSchool.all.map(&:name)
    @schools.flatten!

  end

end
