class CreateServerFamilies < ActiveRecord::Migration
  def change
    create_table :server_families do |t|
      t.string :display
      t.string :gamemode
      t.integer :priority
    end
  end
end
