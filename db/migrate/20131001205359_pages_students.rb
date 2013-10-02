class PagesStudents < ActiveRecord::Migration
  def change
    create_join_table :pages, :students do |t|
      t.index :page_id
      t.index :student_id
    end
  end
end
