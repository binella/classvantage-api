child(@assignment) do
  attributes :id, :title, :assignment_type, :created_at, :total #, :page_id
end
=begin
child([@assignment.page]) do
  attributes :id, :title
end
=end