child(@student) do
  attributes :id, :first_name, :last_name, :full_name, :page_ids
end

child(@student.pages) do
  attributes :id, :title
end