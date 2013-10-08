class PagesRubrics < ActiveRecord::Migration
  def change
    create_join_table :pages, :rubrics do |t|
      t.index :page_id
      t.index :rubric_id
    end
  end
end
