class AddDefaultValueToUserColorAttributes < ActiveRecord::Migration
  def change
    def up
      change_column :users, :color, :default => ''
      change_column :users, :badge_text, :default => ''
      change_column :users, :badge_color, :default => ''
    end

    def down
     change_column :users, :color, :default => nil
     change_column :users, :badge_text, :default => nil
     change_column :users, :badge_color, :default => nil
   end
 end
end
