
child(@assessment) do
  attributes :id, :student_id, :assessable_id, :assessable_type, :value, :mark_ids, :comment
  
end

child(@assessment.marks) do
  attributes :id, :row_id, :assessment_id, :value
end

child([@assessment.assessable]) do
  attributes :id, :title, :page_id
  
  if @assessment.assessable.is_a?(Rubric)
    attributes :description, :row_ids, :overall_expectation_ids, :custom_expectation, :custom_expectation_enabled, :unit_id
  end
  
end

child([@assessment.assessable.page]) do
  attributes :id, :title
  
  if @assessment.assessable.is_a?(Rubric)
    attribute :student_ids
  end
end


if @assessment.assessable.is_a?(Rubric)
  child(@assessment.assessable.rows) do
    attributes :id, :criteria, :level1_description, :level2_description, :level3_description, :level4_description, :created_at
  end
  
  child(@assessment.assessable.overall_expectations) do
    attributes :id, :short_form, :long_form
  end
  
  child([@assessment.assessable.unit]) do
    attributes :id, :grade, :title

    child(:strand) do
      attributes :id

      child(:subject) do
        attributes :id, :title
      end
    end
  end if @assessment.assessable.unit
  
  child(@assessment.assessable.page.students) do
    attributes :id, :first_name, :last_name, :assessment_ids
  end
  
else
  
  child([@assessment.student]) do
    attributes :id, :first_name, :last_name, :assessment_ids
  end 
end