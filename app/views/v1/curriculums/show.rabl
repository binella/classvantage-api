child(@curriculum) do
  attributes :id, :title, :updated_at, :subject_ids
end

child(@curriculum.subjects) do
  attributes :id, :title, :curriculum_id, :strand_ids, :created_at
end

if @curriculum.subjects
  
  @strands = @curriculum.subjects.map(&:strands).flatten
  
  child(@strands) do
    attributes :id, :title, :created_at, :subject_id, :unit_ids
  end
  
  child(@strands.map(&:units).flatten) do
    attributes :id, :title, :grade, :created_at, :strand_id
  end
  
  
end