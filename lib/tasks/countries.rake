namespace :countries do

  desc "Assign slug to countries"
  task :slug => :environment do
    Country.all.each do |country| 
      slug = country.name.try(:parameterize)
      country.slug = slug

      country.save!
      puts "Country #{country.name} updated successfully"
    end
  end

end
