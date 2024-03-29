#object @rubric

child(@rubric) do
  attributes :id, :title, :description, :unit_id, :page_id, :custom_expectation, :custom_expectation_enabled, :row_ids, :overall_expectation_ids, :created_at
  
end

child([@rubric.page]) do
  # should use partial or extend
  # dont really need to include all associations
  attributes :id, :title, :grade, :subject_id, :rubric_ids, :assignment_ids, :student_ids
end

child(@rubric.rows) do
  attributes :id, :criteria, :level1_description, :level2_description, :level3_description, :level4_description, :rubric_id, :created_at
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

child(@rubric.overall_expectations) do
  attributes :id, :short_form, :long_form
end