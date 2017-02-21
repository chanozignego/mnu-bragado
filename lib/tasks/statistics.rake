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

end
