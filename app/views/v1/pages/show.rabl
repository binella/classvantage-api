#object false

child(@page) do
  attributes :id, :title, :grade, :student_ids, :rubric_ids, :created_at
  
  child :subject do
    attributes :id, :title
  end
  
end


child(@page.students) do
  attributes :id, :first_name, :last_name, :full_name, :assessment_ids
end

if @rubrics
  child(@rubrics) do
    attributes :id, :title, :page_id, :row_ids
  end
end

if @assessments
  child(@assessments) do
    attributes :id, :student_id, :rubric_id, :value, :mark_ids
  end

  child(@assessments.map(&:marks).flatten) do
    attributes :id, :value, :assessment_id, :row_id
  end

  child(@rubrics.map(&:rows).flatten) do
    attributes :id
  end
end