class AddPageIdToRubrics < ActiveRecord::Migration
  def change
    add_column :rubrics, :page_id, :integer
  end
end
