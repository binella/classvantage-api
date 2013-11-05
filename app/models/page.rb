class Page < ActiveRecord::Base
  belongs_to :gradebook
  belongs_to :subject
  has_and_belongs_to_many :students, :after_remove => :delete_assessments
  #has_and_belongs_to_many :rubrics # WERE NOT DOING THIS RIGHT NOW BUT JOIN TABLE EXISTS
  has_many :rubrics
  
  
  scope :with_students_and_assessments, includes(:students => [{:assessments => [:marks]}])
  scope :with_rubrics, includes(:rubrics)
  
  def delete_assessments(student)
    # BUG in 4.0.1
    # student.assessments.for_rubrics(rubrics).destroy_all
    student.assessments.for_rubrics(rubrics.all).destroy_all
  end
  
end
