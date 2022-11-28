class CreateUserDms < ActiveRecord::Migration[7.0]
  def change
    create_table :user_dms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dm_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
