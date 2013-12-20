child(@checklist) do
  attributes :id, :title, :description, :unit_id, :page_id, :custom_expectation, :custom_expectation_enabled, :checklist_item_ids, :overall_expectation_ids, :created_at
  
end

child([@checklist.page]) do
  # should use partial or extend
  # dont really need to include all associations
  attributes :id, :title, :grade, :subject_id, :rubric_ids, :assignment_ids, :student_ids
end

child(@checklist.checklist_items) do
  attributes :id, :criteria, :checklist_id, :created_at
end

if @checklist.unit 

  child([@checklist.unit]) do
    attributes :id, :grade, :subject_id

    child(:strand) do
      attribute :id

      child(:subject) do
        attribute :id
      end
    end
  end

end

child(@checklist.overall_expectations) do
  attributes :id, :short_form, :long_form
end