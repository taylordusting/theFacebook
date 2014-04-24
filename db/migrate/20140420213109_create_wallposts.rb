class CreateWallposts < ActiveRecord::Migration
  def change
    create_table :wallposts do |t|
      t.string :content
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
    add_index :wallposts, [:user_id, :friend_id, :created_at]
  end
end
