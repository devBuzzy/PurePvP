class RenameMinecraftUsernamesToMinecraftUsers < ActiveRecord::Migration
  def change
    rename_table :minecraft_usernames, :minecraft_users
  end 
end
