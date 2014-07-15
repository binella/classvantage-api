class AddUnsubscribedToParentEmails < ActiveRecord::Migration
  def change
    add_column :parent_emails, :unsubscribed, :boolean
  end
end
