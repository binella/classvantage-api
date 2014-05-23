class CreateParentEmails < ActiveRecord::Migration
  def change
    create_table :parent_emails do |t|
      t.string :email_address
      t.integer :student_id

      t.timestamps
    end
  end
end
