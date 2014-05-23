class AddCreatorIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :creator_id, :integer
  end
end
