class AddIndexToMinecraftUsernames < ActiveRecord::Migration
  def change
    add_index :minecraft_usernames, :uuid, unique: true
  end
end
