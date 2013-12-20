class Row < ActiveRecord::Base
  belongs_to :rubric
  has_many :marks, :as => :assessable_item, :dependent => :destroy
end
