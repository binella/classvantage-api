child(@assignment) do
  attributes :id, :title#, :page_id
end
=begin
child([@assignment.page]) do
  attributes :id, :title
end
=end