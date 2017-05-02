namespace :ex_schools do

  desc "Create Ex Partakers from actual partakers"
  task :create_from_actual => :environment do
    School.all.each do |school| 
      exschool = ExSchool.new(  name: school.name,
                                email: school.email,
                                phone_number: school.phone_number,
                                city_name: "#{school.location_city}, #{school.location_province}",
                                year: Date.today.year - 1)


      exschool.save!
      puts "ExSchool #{exschool.name} created successfully"
    end
  end

end
