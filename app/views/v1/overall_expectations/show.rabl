child(@overall_expectation) do
  attributes :id, :code, :short_form, :long_form, :unit_id, :specific_expectation_ids
end



child(@overall_expectation.specific_expectations) do
  attributes :code, :description, :example, :friendly_description, :overall_expectation_id
end

#child([@overall_expectation.unit]) do
#  attribute :id, :title, :grade, :overall_expectation_ids
#end