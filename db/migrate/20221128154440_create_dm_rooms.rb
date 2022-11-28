class CreateDmRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :dm_rooms do |t|

      t.timestamps
    end
  end
end
