class AddDefaultValueToGroupColorAttributes < ActiveRecord::Migration
  def change
    def up
      change_column :forem_groups, :color, :default => ''
      change_column :forem_groups, :badge_text, :default => ''
      change_column :forem_groups, :badge_color, :default => ''
    end

    def down
     change_column :forem_groups, :color, :default => nil
     change_column :forem_groups, :badge_text, :default => nil
     change_column :forem_groups, :badge_color, :default => nil
   end
 end
end
