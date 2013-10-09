object @page
attributes :id, :title, :grade

child :subject do
  attributes :id, :title
end

child :students do
  attributes :id, :first_name, :last_name, :full_name
end

child :rubrics do
  attributes :id, :title
end