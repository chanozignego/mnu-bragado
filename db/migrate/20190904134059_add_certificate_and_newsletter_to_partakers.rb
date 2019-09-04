class AddCertificateAndNewsletterToPartakers < ActiveRecord::Migration
  def change
    add_column :partakers, :newsletter, :boolean, null: false, default: false
    add_column :partakers, :certificate, :boolean, null: false, default: false
  end
end
