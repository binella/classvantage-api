class Curriculum < ActiveRecord::Base
  has_many :subjects, :dependent => :destroy
  has_many :strands, :through => :subjects
  has_many :units, :through => :strands
end
