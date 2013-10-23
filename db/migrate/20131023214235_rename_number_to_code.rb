class RenameNumberToCode < ActiveRecord::Migration
  def change
    rename_column :overall_expectations, :number, :code
  end
end
