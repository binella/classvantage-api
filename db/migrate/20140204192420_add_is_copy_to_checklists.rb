class AddIsCopyToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :is_copy, :boolean
  end
end
