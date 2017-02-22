class ExcelImportService
  require 'csv'


  def self.import(file)
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