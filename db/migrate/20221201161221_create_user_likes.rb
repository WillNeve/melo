class CreateUserLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :user_likes do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
