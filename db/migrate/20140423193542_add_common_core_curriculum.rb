class AddCommonCoreCurriculum < ActiveRecord::Migration
  def up
    Curriculum.create :title => "US - Common Core"
  end
  
  def down
    Curriculum.where(:title => "US - Common Core").destroy
  end
end
