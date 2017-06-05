module Admin
  class ArchivesController < Admin::ApplicationController

    def new
      @folders = Folder.all
      # original_folders = Folder.where(abstract_file_id: nil)
      # folders = []
      # original_folders.each do |folder|
      #   id = folder.id
      #   name = folder.name
      #   childrens = []
      #   folder.subfolders.each do |subfolder|
      #     subid = subfolder.id
      #     subname = subfolder.name
      #     childrens << {id: subid, name: subname, level: 2}
      #   end
      #   folders << {id: id, name: name, level: 1, children: childrens}
      # end 

      # @folders = folders
      super
    end

    def edit
      @folders = Folder.all
      super
    end

  end
end