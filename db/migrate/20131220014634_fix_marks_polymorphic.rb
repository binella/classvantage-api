class FixMarksPolymorphic < ActiveRecord::Migration
  def change
    rename_column :marks, :row_id, :assessable_item_id
  end
end
