class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.integer :student_id
      t.integer :rubric_id
      t.integer :value

      t.timestamps
    end
  end
end
