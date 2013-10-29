class FixColumnTypes < ActiveRecord::Migration
  def change
    change_column :overall_expectations, :long_form, :text
    change_column :specific_expectations, :description, :text
    change_column :specific_expectations, :example, :text
    change_column :specific_expectations, :friendly_description, :text
    change_column :rubrics, :description, :text
    
  end
end
