class Page < ActiveRecord::Base
  belongs_to :gradebook
  belongs_to :subject
  has_and_belongs_to_many :students
  #has_and_belongs_to_many :rubrics # WERE NOT DOING THIS RIGHT NOW BUT JOIN TABLE EXISTS
  has_many :rubrics
  
  
  accepts_nested_attributes_for :students, :allow_destroy => true
  
  
  scope :with_students_and_assessments, includes(:students => [{:assessments => [:marks]}])
  scope :with_rubrics, includes(:rubrics)
  
end
