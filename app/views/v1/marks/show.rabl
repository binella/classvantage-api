child(@mark) do
  attributes :id, :assessment_id, :assessable_item_id, :assessable_item_type, :value
end

child([@mark.assessment]) do
  attributes :id, :student_id, :assessable_id, :assessable_type, :value, :mark_ids
end