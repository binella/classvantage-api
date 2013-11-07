class FixAssessments < ActiveRecord::Migration
  def change
    rename_column :assessments, :rubric_id, :assessable_id
    add_column :assessments, :assessable_type, :string
  end
end
