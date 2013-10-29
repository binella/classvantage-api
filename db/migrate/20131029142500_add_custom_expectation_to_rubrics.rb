class AddCustomExpectationToRubrics < ActiveRecord::Migration
  def change
    add_column :rubrics, :custom_expectation, :string
  end
end
