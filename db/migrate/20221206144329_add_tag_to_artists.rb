class AddTagToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :tag, :string
  end
end
