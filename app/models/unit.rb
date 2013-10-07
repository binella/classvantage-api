class Unit < ActiveRecord::Base
  belongs_to :strand
  
  
  scope :with_subject, includes(:strand => :subject)
  # VERY BAD
  #def title
  #  self.title || self.strand.title
  #end
end
