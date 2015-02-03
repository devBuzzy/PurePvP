class CreateDeaths < ActiveRecord::Migration
  def change
    create_table :deaths do |t|
      t.integer :killer_uuid
      t.integer :victim_uuid

      t.string :server_session_id

      t.string :weapon

      t.time :timestamp
    end
  end
end
