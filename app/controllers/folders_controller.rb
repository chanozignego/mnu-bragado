class FoldersController < ApplicationController

  def show
    @folder = Folder.find(params[:id])
    @files = @folder.abstract_files
  end

end
