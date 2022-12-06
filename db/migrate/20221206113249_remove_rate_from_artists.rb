class RemoveRateFromArtists < ActiveRecord::Migration[7.0]
  def change
    remove_column :artists, :rate
  end
end
