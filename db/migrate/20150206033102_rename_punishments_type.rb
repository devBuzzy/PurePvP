class RenamePunishmentsType < ActiveRecord::Migration
  def change
    rename_column :punishments, :type, :punishment_type
  end
end
