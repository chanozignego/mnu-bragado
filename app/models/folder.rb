class Folder < AbstractFile

  def full_name
    if folder.present?
      folder.full_name + " / " + name
    else
      name
    end
  end
end
