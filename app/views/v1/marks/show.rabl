child(@mark) do
  attributes :id, :assessment_id, :row_id, :value
end

child([@mark.assessment]) do
  attributes :id, :student_id, :rubric_id, :value, :mark_ids
end