collection @units

attributes :id, :grade

child(:strand) do |unit|
  attributes :id, :title
  
  child(:subject) do
    attributes :id, :title
  end
end