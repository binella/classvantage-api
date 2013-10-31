class Row < ActiveRecord::Base
  belongs_to :rubric
  has_many :marks, :dependent => :destroy
end
