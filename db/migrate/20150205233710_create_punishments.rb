class CreatePunishments < ActiveRecord::Migration
  def change
    create_table :punishments do |t|
      t.string :reason
      t.string :type
      t.time :expires_at
      t.time :punished_at
      t.string :punisher
      t.string :punished
    end
  end
end
