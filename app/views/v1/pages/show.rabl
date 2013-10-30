#object false

child(@page) do
  attributes :id, :title, :grade, :student_ids, :rubric_ids, :created_at
  
  child :subject do
    attributes :id, :title
  end
  
end


child(@page.students) do
  attributes :id, :first_name, :last_name, :full_name, :assessment_ids
end

child(@page.rubrics) do
  attributes :id, :title
end

child(Assessment.for_students(@page.student_ids).for_rubrics(@page.rubric_ids)) do
  attributes :id, :student_id, :rubric_id, :value
end