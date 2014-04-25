child(@subject) do
  attributes :id, :title, :strand_ids, :curriculum_id, :created_at
end

child(@subject.strands) do
  attributes :id, :title, :subject_id, :created_at
end