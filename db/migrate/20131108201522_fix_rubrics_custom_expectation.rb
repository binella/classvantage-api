class FixRubricsCustomExpectation < ActiveRecord::Migration
  def self.up
    change_column :rubrics, :custom_expectation, :text
  end
  
  def self.down
    change_column :rubrics, :custom_expectation, :string
  end
end
