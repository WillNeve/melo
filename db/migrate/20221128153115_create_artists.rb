class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.text :description
      t.boolean :is_group, default: false
      t.float :rate
      t.string :instrument
      t.string :soundcloud_url
      t.string :spotify_url
      t.string :bandcamp_url
      t.string :instagram_url
      t.string :tiktok_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
