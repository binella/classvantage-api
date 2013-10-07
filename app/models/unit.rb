class Unit < ActiveRecord::Base
  belongs_to :strand
  
  # VERY BAD
  #def title
  #  self.title || self.strand.title
  #end
end
