object false

child(@pages) do
  attributes :id, :title, :grade, :created_at #, :student_ids, :rubric_ids, :assignment_ids, :checklist_ids
  
  child :subject do
    attributes :id, :title
  end
end
