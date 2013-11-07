class CreateOverallExpectationsRubrics < ActiveRecord::Migration
  def change
    create_join_table :overall_expectations, :rubrics do |t|
      #t.index [:overall_expectation_id, :rubric_id]
      #t.index [:rubric_id, :overall_expectation_id]
    end
  end
end
