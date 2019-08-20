class CreateCountryPictures < ActiveRecord::Migration
  def change
    create_table :country_pictures do |t|
      t.string :image
      t.belongs_to :country, index: true

      t.timestamps null: false
    end
  end
end
