class AddInfoToForemGroups < ActiveRecord::Migration
  def change
    add_column :forem_groups, :color, :string
    add_column :forem_groups, :badge_text, :string
    add_column :forem_groups, :badge_color, :string
    add_column :forem_groups, :priority, :integer
  end
end
