
child(@assessment) do
  attributes :id, :student_id, :assessable_id, :assessable_type, :value, :mark_ids, :comment
  
end

child(@assessment.marks) do
  attributes :id, :row_id, :assessment_id, :value
end

child([@assessment.assessable]) do
  attributes :id, :title, :page_id
  
  if @assessment.assessable.is_a?(Rubric)
    attribute :row_ids
  end
  
end

child([@assessment.assessable.page]) do
  attributes :id, :title
end

child([@assessment.student]) do
  attributes :id, :first_name, :last_name, :assessment_ids
end

if @assessment.assessable.is_a?(Rubric)
  child(@assessment.assessable.rows) do
    attributes :id, :criteria, :level1_description, :level2_description, :level3_description, :level4_description, :created_at
  end
end