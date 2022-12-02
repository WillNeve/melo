class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true
      t.string :event_type
      t.string :location

      t.timestamps
    end
  end
end
