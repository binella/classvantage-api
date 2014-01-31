class AddTotalToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :total, :integer
  end
end
