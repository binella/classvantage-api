class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.text :criteria
      t.text :level1_description
      t.text :level2_description
      t.text :level3_description
      t.text :level4_description
      t.integer :rubric_id

      t.timestamps
    end
  end
end
