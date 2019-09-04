class AddCertificateAndNewsletterToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :newsletter, :boolean, null: false, default: false
    add_column :trainers, :certificate, :boolean, null: false, default: false
    add_column :professors, :newsletter, :boolean, null: false, default: false
    add_column :professors, :certificate, :boolean, null: false, default: false
  end
end
