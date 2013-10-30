child(@assessment) do
  attributes :id, :student_id, :rubric_id, :value, :mark_ids
  
end

child(@assessment.marks) do
  attributes :id, :row_id, :assessment_id, :value
end

child([@assessment.rubric]) do
  attributes :id, :title, :page_id, :row_ids
end

child([@assessment.rubric.page]) do
  attributes :id, :title
end

child([@assessment.student]) do
  attributes :id, :first_name, :last_name
end

child(@assessment.rubric.rows) do
  attributes :id, :criteria, :level1_description, :level2_description, :level3_description, :level4_description
end