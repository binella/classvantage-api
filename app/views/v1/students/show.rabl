child(@student) do
  attributes :id, :first_name, :last_name, :full_name, :page_ids, :assessment_ids
end

child(@student.assessments) do
  attributes :id, :student_id, :rubric_id, :value, :mark_ids
end

#child(@student.pages) do
#  attributes :id, :title, :student_ids
#end