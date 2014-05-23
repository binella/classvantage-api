object false

child(@students) do
  attributes :id, :first_name, :last_name, :full_name
  
  node(:parent_emails) do |student|
    student.parent_emails.map(&:email_address)
  end
  
  node(:can_edit) { |student| student.creator_id == current_user.id }
  
end