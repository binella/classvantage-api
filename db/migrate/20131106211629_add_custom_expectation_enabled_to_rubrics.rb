class AddCustomExpectationEnabledToRubrics < ActiveRecord::Migration
  def change
    add_column :rubrics, :custom_expectation_enabled, :boolean
  end
end
