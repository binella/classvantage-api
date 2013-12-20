class CreateChecklistItems < ActiveRecord::Migration
  def change
    create_table :checklist_items do |t|
      t.text :criteria
      t.integer :checklist_id

      t.timestamps
    end
  end
end
