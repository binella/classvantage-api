class SetCreatorForExistingStudents < ActiveRecord::Migration
  def up
    User.all.each do |user|
      Student.in_workspace(user).update_all :creator_id => user.id
    end
  end
  
  def down
    Student.update_all :creator_id => nil
  end
end
