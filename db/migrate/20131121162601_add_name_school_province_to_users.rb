class AddNameSchoolProvinceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :school, :string
    add_column :users, :province, :string
  end
end
