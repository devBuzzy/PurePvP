class AddGamemodeToDeaths < ActiveRecord::Migration
  def change
    add_column :deaths, :gamemode, :string
  end
end
