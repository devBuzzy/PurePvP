class AddShowStaffPageToForemGroups < ActiveRecord::Migration
  def change
    add_column :forem_groups, :show_on_staff_page, :boolean, :default => false
  end
end
