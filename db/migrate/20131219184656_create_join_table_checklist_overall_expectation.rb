class CreateJoinTableChecklistOverallExpectation < ActiveRecord::Migration
  def change
    create_join_table :checklists, :overall_expectations do |t|
      # t.index [:checklist_id, :overall_expectation_id]
      # t.index [:overall_expectation_id, :checklist_id]
    end
  end
end
