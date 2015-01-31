class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :reporter_id
      t.text :reason
      t.text :evidence
      t.boolean :closed

      t.timestamps
    end
  end
end
