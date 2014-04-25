class Subject < ActiveRecord::Base
  belongs_to :curriculum
  has_many :strands, :dependent => :destroy

end
