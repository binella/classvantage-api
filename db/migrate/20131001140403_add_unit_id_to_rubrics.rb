class AddUnitIdToRubrics < ActiveRecord::Migration
  def change
    add_column :rubrics, :unit_id, :integer
  end
end
