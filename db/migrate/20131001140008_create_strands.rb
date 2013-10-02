class CreateStrands < ActiveRecord::Migration
  def change
    create_table :strands do |t|
      t.string :title
      t.integer :subject_id

      t.timestamps
    end
  end
end
