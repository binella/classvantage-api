class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :assessment_id
      t.integer :row_id
      t.integer :value

      t.timestamps
    end
  end
end
