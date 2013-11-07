class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.integer :page_id

      t.timestamps
    end
  end
end
