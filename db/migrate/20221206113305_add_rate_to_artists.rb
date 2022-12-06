class AddRateToArtists < ActiveRecord::Migration[7.0]
  def change
    add_monetize :artists, :rate, currency: { present: false }
  end
end
