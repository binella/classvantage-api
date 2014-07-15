class CreateAgendaItems < ActiveRecord::Migration
  def change
    create_table :agenda_items do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :page_id

      t.timestamps
    end
  end
end
