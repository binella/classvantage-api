class Unit < ActiveRecord::Base
  belongs_to :strand
  
  
  scope :with_subject, includes(:strand => :subject)
  
  def title
    self.read_attribute(:title) || self.strand.title
  end
end
