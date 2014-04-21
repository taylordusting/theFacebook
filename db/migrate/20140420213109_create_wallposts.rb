class CreateWallposts < ActiveRecord::Migration
  def change
    create_table :wallposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
