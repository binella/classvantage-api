class Assessment < ActiveRecord::Base
  belongs_to :student
  belongs_to :rubric
  has_many :marks, :dependent => :destroy
  
  
  scope :for_rubrics, lambda { |rubric| where(:rubric_id => rubric) } 
  scope :for_students, lambda { |student_ids| where(:student_id => student_ids) }
  scope :with_marks, includes(:marks)
  
end
