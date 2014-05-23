class Assessment < ActiveRecord::Base
  belongs_to :student, :touch => true
  belongs_to :assessable, :polymorphic => true, :touch => true
  has_many :marks, :dependent => :destroy
  
  
  scope :for_rubrics, lambda { |rubric| where(:assessable_id => rubric, :assessable_type => 'Rubric') }
  scope :for_rubrics_or_assignments_or_checklists, lambda { |rubric_ids, assignment_ids, checklist_ids| 
    where("(assessable_id IN (?) AND assessable_type = 'Rubric') OR 
          (assessable_id IN (?) AND assessable_type = 'Assignment') OR
          (assessable_id IN (?) AND assessable_type = 'Checklist')",
          rubric_ids, assignment_ids, checklist_ids)
  }
  scope :for_students, lambda { |student_ids| where(:student_id => student_ids) }
  scope :with_marks, -> { includes(:marks) }
  
end
