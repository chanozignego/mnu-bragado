class PictureUploader < FileUploader
  include CarrierWave::MiniMagick

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process :resize_to_fill => [300, 300]
  end

  version :mediumthumb do
    process :resize_to_fill => [200, 200]
  end

  version :smallthumb do
    process :resize_to_fill => [150, 150]
  end

end
