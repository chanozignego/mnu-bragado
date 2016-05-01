class PictureUploader < FileUploader
  include CarrierWave::MiniMagick

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process :resize_to_fill => [300, 300]
  end

  version :smallthumb do
    process :resize_to_fill => [100, 100]
  end

end
