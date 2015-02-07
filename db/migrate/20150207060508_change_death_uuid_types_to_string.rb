class ChangeDeathUuidTypesToString < ActiveRecord::Migration
  def up
    change_column :deaths, :killer_uuid, :string
    change_column :deaths, :victim_uuid, :string
  end

  def down
    change_column :deaths, :killer_uuid, :integer
    change_column :deaths, :victim_uuid, :integer
  end
end
