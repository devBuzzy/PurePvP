class CreateMinecraftUsernames < ActiveRecord::Migration
  def change
    create_table :minecraft_usernames do |t|
      t.string :username
      t.string :uuid
      t.column :created_at, :datetime
    end
  end
end
