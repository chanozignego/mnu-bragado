class AbstractFile < ActiveRecord::Base
  mount_uploader :file, FileUploader
  belongs_to :folder, class_name: "Folder", foreign_key: 'abstract_file_id'

  FILE_TYPES = %i[image pdf word excel folder]
  CLASSIFICATIONS = %i[ag sti cs ecosoc onumujeres segib general authorities g20]
  ARCHIVE_TYPES = %i[regulation topic dinamic]

  enum file_type: FILE_TYPES
  enum classification: CLASSIFICATIONS
  enum archive_type: ARCHIVE_TYPES

  has_many :abstract_files, dependent: :destroy

  def file_type_name
    I18n.t("abstract_file.file_types")[file_type.try(:to_sym)]
  end

  def classification_name
    I18n.t("abstract_file.classifications")[classification.try(:to_sym)]
  end 

  def archive_type_name
    I18n.t("abstract_file.archive_types")[archive_type.try(:to_sym)]
  end 

  # def abstract_files
  #   AbstractFile.where(abstract_file_id: id)
  # end

  def subfolders
    Folder.where(abstract_file_id: id)
  end

  def full_name
    if folder.present?
      folder.full_name + " / " + name
    else
      name
    end
  end

end
