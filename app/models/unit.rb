class Unit < ActiveRecord::Base
  belongs_to :strand
  has_many :overall_expectations
  
  accepts_nested_attributes_for :overall_expectations, :allow_destroy => true
  
  scope :with_subject, includes(:strand => :subject)
  
  def title
    self.read_attribute(:title) || self.strand.title
  end
end
