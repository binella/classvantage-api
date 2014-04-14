#object false

child(@page) do
  attributes :id, :title, :grade, :student_ids, :rubric_ids, :assignment_ids, :checklist_ids, :created_at
  
  child :subject do
    attributes :id, :title
  end
  
end


child(@page.students) do
  attributes :id, :first_name, :last_name, :full_name, :assessment_ids, :updated_at
end


child(@rubrics) do
  attributes :id, :title, :page_id, :row_ids, :created_at
end

child(@checklists) do
  attributes :id, :title, :page_id, :checklist_item_ids, :created_at
end

child(@page.assignments) do
  attributes :id, :title, :assignment_type, :page_id, :created_at, :total
end

if @assessments
  child(@assessments) do
    attributes :id, :student_id, :assessable_id, :assessable_type, :value, :mark_ids, :comment
  end

  child(@assessments.map(&:marks).flatten) do
    attributes :id, :value, :assessment_id, :assessable_item_id, :assessable_item_type
  end


end

if @rubrics

  child(@rubrics.map(&:rows).flatten) do
    attributes :id, :criteria, :level1_description, :level2_description, :level3_description, :level4_description, :created_at, :rubric_id
  end
end

if @checklists
  child(@checklists.map(&:checklist_items).flatten) do
    attributes :id, :criteria, :created_at, :checklist_id
  end
end