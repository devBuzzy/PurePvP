class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :ip
      t.integer :port
      t.time :last_ping

      t.timestamps
    end
  end
end
