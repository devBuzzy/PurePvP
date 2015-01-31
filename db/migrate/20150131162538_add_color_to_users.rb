class AddColorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :color, :string
    add_column :users, :badge_text, :string
    add_column :users, :badge_color, :string
  end
end
