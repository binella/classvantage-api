child(@unit) do
  attributes :id, :grade, :title, :overall_expectations_id

  node (:subject_id) { |u| u.strand.subject_id }

  child(:strand) do |unit|
    attributes :id, :title

    child(:subject) do
      attributes :id, :title
    end
  end
end

child(@unit.overall_expectations) do
  attributes :id, :code, :short_form, :long_form, :created_at
end