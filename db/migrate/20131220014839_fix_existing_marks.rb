class FixExistingMarks < ActiveRecord::Migration
  def change
    Mark.update_all :assessable_item_type => 'Row'
  end
end
