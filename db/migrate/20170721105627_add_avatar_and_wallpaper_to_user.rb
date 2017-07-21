class AddAvatarAndWallpaperToUser < ActiveRecord::Migration[5.1]
  def up
    add_attachment :users, :avatar
    add_attachment :users, :wallpaper
  end

  def down
    remove_attachment :users,:wallpaper
    remove_attachment :users, :avatar
  end
end
