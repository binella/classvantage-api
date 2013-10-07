collection @units

attributes :id, :grade, :title

node (:subject_id) { |u| u.strand.subject_id }

child(:strand) do |unit|
  attributes :id, :title
  
  child(:subject) do
    attributes :id, :title
  end
end