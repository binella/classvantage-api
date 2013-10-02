class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :title
      t.integer :curriculum_id

      t.timestamps
    end
  end
end
