class CreateRubrics < ActiveRecord::Migration
  def change
    create_table :rubrics do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
