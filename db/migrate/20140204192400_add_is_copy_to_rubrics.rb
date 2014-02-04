class AddIsCopyToRubrics < ActiveRecord::Migration
  def change
    add_column :rubrics, :is_copy, :boolean
  end
end
