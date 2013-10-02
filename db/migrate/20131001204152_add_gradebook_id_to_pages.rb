class AddGradebookIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :gradebook_id, :integer
  end
end
