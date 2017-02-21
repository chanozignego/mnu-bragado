namespace :ex_partakers do

  desc "Create Ex Partakers from actual partakers"
  task :create_from_actual => :environment do
    Partaker.all.each do |partaker| 
      expartaker = ExPartaker.new(partaker_type: partaker.type.try(:underscore),
                                first_name: partaker.first_name,
                                last_name: partaker.last_name,
                                dni: partaker.dni,
                                email: partaker.email,
                                phone_number: partaker.phone_number,
                                school_name: partaker.school_name || "",
                                city_name: "#{partaker.school_location_city}, #{partaker.school_location_province}",
                                country_name: partaker.type == "Delegate" ? partaker.delegation_country_name : nil,
                                role: partaker.rol,
                                year: partaker.year)


      expartaker.save!
      puts "ExPartaker #{expartaker.full_name} created successfully"
    end
  end

end
