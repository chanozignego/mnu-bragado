namespace :sections do

  desc "Create Ex Partakers from actual partakers"
  task :create_basic_sections => :environment do
    folders = []
    folders << Folder.create( name: "General", 
                                description: "Archivos en general. Tópicos, reglamentos, dinámica y demás",
                                file_type: "folder", 
                                classification: "general")
    folders << Folder.create( name: "Asamblea General", 
                                description: "Archivos para la Asamblea General. Tópicos, reglamentos, dinámica y demás",
                                file_type: "folder", 
                                classification: "ag")
    folders << Folder.create( name: "Sala de Tratados", 
                                description: "Archivos para la Sala de Tratados Internacionales. Tópicos, reglamentos, dinámica y demás",
                                file_type: "folder", 
                                classification: "sti")
    folders << Folder.create( name: "Consejo de Seguridad", 
                                description: "Archivos para el Consejo de Seguridad. Tópicos, reglamentos, dinámica y demás",
                                file_type: "folder", 
                                classification: "cs")
    folders << Folder.create( name: "SEGIB", 
                                description: "Archivos para SEGIB. Tópicos, reglamentos, dinámica y demás",
                                file_type: "folder", 
                                classification: "segib")
    folders << Folder.create( name: "ECOSOC", 
                                description: "Archivos para ECOSOC. Tópicos, reglamentos, dinámica y demás",
                                file_type: "folder", 
                                classification: "ecosoc")
    folders << Folder.create( name: "Autoridades", 
                                description: "Archivos para las Autoridades. Tópicos, reglamentos, dinámica y demás",
                                file_type: "folder", 
                                classification: "authorities")

    folders << Folder.create( name: "G20", 
                                description: "Archivos para G20. Tópicos, reglamentos, dinámica y demás",
                                file_type: "folder", 
                                classification: "g20")
    
    folders.each do |folder|
      Folder.create( name: "Tópicos", 
                      description: "Tópicos de #{folder.name}",
                      file_type: "folder", 
                      classification: folder.classification,
                      archive_type: "topic",
                      folder: folder)

      Folder.create( name: "Reglamentos", 
                      description: "Reglamentos de #{folder.name}",
                      file_type: "folder", 
                      classification: folder.classification,
                      archive_type: "regulation",
                      folder: folder)

      Folder.create( name: "Dinámica", 
                      description: "Dinámica de #{folder.name}",
                      file_type: "folder", 
                      classification: folder.classification,
                      archive_type: "dinamic",
                      folder: folder)

    end
  end

  task :refactor_basic_sections => :environment do

    AbstractFile.segib.order(id: :desc).destroy_all

    folder = Folder.create( name: "G20", 
                            description: "Archivos para G20. Tópicos, reglamentos, dinámica y demás",
                            file_type: "folder", 
                            classification: "g20")

    Folder.create( name: "Tópicos", 
                    description: "Tópicos de #{folder.name}",
                    file_type: "folder", 
                    classification: folder.classification,
                    archive_type: "topic",
                    folder: folder)

    Folder.create( name: "Reglamentos", 
                    description: "Reglamentos de #{folder.name}",
                    file_type: "folder", 
                    classification: folder.classification,
                    archive_type: "regulation",
                    folder: folder)

    Folder.create( name: "Dinámica", 
                    description: "Dinámica de #{folder.name}",
                    file_type: "folder", 
                    classification: folder.classification,
                    archive_type: "dinamic",
                    folder: folder)

    Folder.create( name: "Material", 
                    description: "Material de #{folder.name}",
                    file_type: "folder", 
                    classification: folder.classification,
                    archive_type: "dinamic",
                    folder: folder)
  end

end
