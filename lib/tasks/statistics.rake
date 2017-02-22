namespace :statistics do

  desc "Generate Statistics"
  task :create => :environment do

    current_year = Date.today.year

    (2013..current_year).each do |year|
      delegations = Delegation.where(year: year).count
      partakers = Partaker.where(year: year).count
      delegates = Delegate.where(year: year).count
      authorities = Authority.where(year: year).count
      stats = Statistic.create(delegations: delegations, partakers: partakers, delegates: delegates, authorities: authorities, year: year)
      puts "Statistics for #{stats.year} created successfully"
    end
  end

  task :generate_from_ex_partakers => :environment do
    current_year = Date.today.year

    (2013..current_year-1).each do |year|
      delegations = ExPartaker.where(year: year).where(partaker_type: 0).count(:country_name, distinct: true)
      partakers = ExPartaker.where(year: year).count
      delegates = ExPartaker.where(year: year).where(partaker_type: 0).count
      authorities = ExPartaker.where(year: year).where(partaker_type: 1).count
      stats = Statistics.where(year: year).first || Statistics.new
      stats.delegations = delegations
      stats.partakers = partakers
      stats.delegates = delegates
      stats.authorities = authorities
      stats.year = year
      stats.save!
      puts "Statistics for #{stats.year} updated successfully"
    end
  end

end
