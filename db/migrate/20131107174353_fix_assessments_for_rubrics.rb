class FixAssessmentsForRubrics < ActiveRecord::Migration
  def change
    Assessment.update_all :assessable_type => 'Rubric'
  end
end
