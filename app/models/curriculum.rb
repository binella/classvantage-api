class Curriculum < ActiveRecord::Base
  has_many :subjects, :dependent => :destroy
  has_many :strands, :through => :subjects
  has_many :units, :through => :strands
  belongs_to :parent_curriculum, :class_name => 'Curriculum', :foreign_key => 'parent_curriculum'
  
end
