namespace :ex_professors do

  desc "Create Ex Partakers from actual partakers"
  task :create_from_actual => :environment do
    Professor.all.each do |professor| 
      exprofessor = ExProfessor.new(first_name: professor.first_name,
                                    last_name: professor.last_name,
                                    email: professor.email,
                                    phone_number: professor.phone_number,
                                    school_name: professor.school.try(:name) || "",
                                    city_name: "#{professor.school.try(:location_city)}, #{professor.school.try(:location_province)}",
                                    year: Date.today.year - 1)


      exprofessor.save!
      puts "Exprofessor #{exprofessor.first_name} #{exprofessor.last_name} created successfully"
    end
  end

end
