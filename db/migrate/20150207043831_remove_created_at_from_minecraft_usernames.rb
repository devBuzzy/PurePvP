class RemoveCreatedAtFromMinecraftUsernames < ActiveRecord::Migration
  def change
    remove_column :minecraft_usernames, :created_at
  end
end
