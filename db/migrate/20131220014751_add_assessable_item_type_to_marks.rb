class AddAssessableItemTypeToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :assessable_item_type, :string
  end
end
