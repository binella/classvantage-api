child(@specific_expectation) do
  attributes :id, :code, :description, :example, :friendly_description, :overall_expectation_id
end

#child([@specific_expectation.overall_expectation]) do
#  attributes :id, :code, :specific_expectation_ids
#end