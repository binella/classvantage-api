class CreateJoinTableChecklistPage < ActiveRecord::Migration
  def change
    create_join_table :checklists, :pages do |t|
      # t.index [:checklist_id, :page_id]
      # t.index [:page_id, :checklist_id]
    end
  end
end
