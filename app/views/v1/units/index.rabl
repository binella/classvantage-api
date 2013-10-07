collection @units

attributes :id, :grade

node (:subject_id) { |u| u.strand.subject_id }

child(:strand) do |unit|
  attributes :id, :title
  
  child(:subject) do
    attributes :id, :title
  end
end