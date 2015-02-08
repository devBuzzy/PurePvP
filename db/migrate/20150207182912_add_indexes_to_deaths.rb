class AddIndexesToDeaths < ActiveRecord::Migration
  def change
    add_index :deaths, :killer_uuid
    add_index :deaths, :victim_uuid
  end
end
