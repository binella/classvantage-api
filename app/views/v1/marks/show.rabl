child(@mark) do
  attributes :id, :assessment_id, :row_id, :value
end

child([@mark.assessment]) do
  attributes :id, :student_id, :assessable_id, :assessable_type, :value, :mark_ids
end