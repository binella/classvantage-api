object @rubric
attributes :id, :title, :description, :unit_id


child(:page) do
  attributes :id, :title, :grade, :subject_id
end

child(:unit) do
  attributes :id, :grade
  
  child(:strand) do
    attribute :id
    
    child(:subject) do
      attribute :id
    end
  end
end