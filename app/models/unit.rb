class Unit < ActiveRecord::Base
  belongs_to :strand
  
  def title
    self.title || self.strand.title
  end
end
