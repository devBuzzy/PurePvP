class AddUsernameHistoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username_history, :text
  end
end
