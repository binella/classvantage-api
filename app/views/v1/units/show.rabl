child(@unit) do
  attributes :id, :grade, :title, :overall_expectation_ids, :strand_id
=begin
  node (:subject_id) { |u| u.strand.subject_id }

  child(:strand) do |unit|
    attributes :id, :title

    child(:subject) do
      attributes :id, :title
    end
  end
=end
end

child([@unit.strand]) do
  attributes :id, :title, :subject_id, :unit_ids
end

child([@unit.strand.subject]) do
  attributes :id, :title
end

child(@unit.overall_expectations) do
  attributes :id, :code, :short_form, :long_form, :unit_id, :created_at, :specific_expectation_ids
end

# There must be a better way for this!!
child(@unit.overall_expectations.map(&:specific_expectations).flatten) do
  attributes :id, :code, :description, :example, :friendly_description, :overall_expectation_id, :created_at
end