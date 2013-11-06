#object @rubric

child(@rubric) do
  attributes :id, :title, :description, :unit_id, :page_id, :custom_expectation, :row_ids
  
end

child([@rubric.page]) do
  # should use partial or extend
  attributes :id, :title, :grade, :subject_id, :rubric_ids, :student_ids
end

child(@rubric.rows) do
  attributes :id, :criteria, :level1_description, :level2_description, :level3_description, :level4_description, :rubric_id
end

if @rubric.unit 

  child([@rubric.unit]) do
    attributes :id, :grade, :subject_id

    child(:strand) do
      attribute :id

      child(:subject) do
        attribute :id
      end
    end
  end

end