class ExcelImportService
  require 'csv'

  def self.import_countries(file)
    spreadsheet = open_spreadsheet(file)
    header = ["name", "regional_group", "ag", "sti", "cs", "g20", "ecosoc"]
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      row["name"] = "" unless row["name"].present?

      if ["Africano", "africano", "African"].include?(row["regional_group"])
        row["regional_group"] = :africa
      elsif ["Asia y Pacífico", "Asia y Pacifico", "Asia y pacífico", "Asia y pacifico", "asia y pacifico", "asia"].include?(row["regional_group"])
        row["regional_group"] = :asia
      elsif ["Europa y Otros", "Europa y otros", "Europa", "europa", "europa y otros"].include?(row["regional_group"])
        row["regional_group"] = :europe
      elsif ["América y el Caribe", "America y el Caribe", "Latinoamerica y el Caribe", "Latinoamericano", "latinoamericano", "lationamerica y el caribe", "Latinoamerica y el caribe", "Latinoamerica y caribe", "Latinoamerica y Caribe"].include?(row["regional_group"])
        row["regional_group"] = :latam
      elsif ["Observadora", "Observador", "observadora", "observador"].include?(row["regional_group"])
        row["regional_group"] = :observer
      else
        row["regional_group"] = :noting
      end

      row["ag"] = row["ag"].present?
      row["sti"] = row["sti"].present?
      row["cs"] = row["cs"].present?
      row["g20"] = row["g20"].present?
      row["ecosoc"] = row["ecosoc"].present?

      country = Country.new(row.to_hash)  
      country.state = :pending    
      country.save!
    end
  end

  def self.import_partakers(file)
    spreadsheet = open_spreadsheet(file)
    header = ["first_name", "last_name", "partaker_type", "school_name", "city_name", "phone_number", "year", "country_name"]
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      
      row["partaker_type"] = row["partaker_type"] == "Delegado" ? :delegate : :authority

      row["first_name"] = "" if row["first_name"] == nil 
      row["last_name"] = "" if row["last_name"] == nil 
      row["school_name"] = "" if row["school_name"] == nil 
      row["city_name"] = "" if row["city_name"] == nil 

      expartaker = ExPartaker.new(row.to_hash)      
      expartaker.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    #when ".csv" then Roo::Csv.new (file.path nil, :ignore)
    when ".xls" then Roo::Excel.new (file.path)
    #when ".xlsx" then Excelx.new (file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end