class FixAssessmentsValue < ActiveRecord::Migration
  def up
    change_column :assessments, :value, :string
  end
  
  def down
    change_column :assessments, :value, :integer
  end
end
