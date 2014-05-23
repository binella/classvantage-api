object false

child(@existing_students => :existing_students) do
  attributes :id, :first_name, :last_name, :full_name, :page_ids
  
  node(:parent_emails) do |student|
    student.parent_emails.map(&:email_address)
  end
end