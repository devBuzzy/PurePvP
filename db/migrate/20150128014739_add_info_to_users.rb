class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uuid, :string
    add_column :users, :rank, :string
    add_column :users, :first_join, :time
    add_column :users, :last_join, :time
    add_column :users, :last_seen, :time
  end
end
