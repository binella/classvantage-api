class AddBasicPageAttributesToPages < ActiveRecord::Migration
  def change
    add_column :pages, :grade, :integer
    add_column :pages, :subject_id, :integer
  end
end
