class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.string :title
      t.text :description
      t.integer :unit_id
      t.integer :page_id
      t.text :custom_expectation
      t.boolean :custom_expectation_enabled

      t.timestamps
    end
  end
end
