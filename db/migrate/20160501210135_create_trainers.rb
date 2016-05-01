class CreateTrainers < ActiveRecord::Migration
  def change
    create_table :trainers do |t|

      t.belongs_to :user

      t.string :rol
      t.string :facebook_url
      t.string :twitter_url
      t.string :instagram_url

      t.string :principal_image
      t.string :secondary_image

      t.timestamps null: false
    end
  end
end
