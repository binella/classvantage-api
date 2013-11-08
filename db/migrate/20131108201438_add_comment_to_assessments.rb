class AddCommentToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :comment, :text
  end
end
