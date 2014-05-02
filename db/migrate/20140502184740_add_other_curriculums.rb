class AddOtherCurriculums < ActiveRecord::Migration
  def up
    add_column :curriculums, :parent_curriculum, :integer

  end
end
