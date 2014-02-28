object false

child(@pages) do
  attributes :id, :title, :grade, :student_ids, :rubric_ids, :assignment_ids, :checklist_ids, :created_at
  
  child :subject do
    attributes :id, :title
  end
end
