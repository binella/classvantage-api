class Assignment < ActiveRecord::Base
  belongs_to :page
  has_many :assessments, :as => :assessable, :dependent => :destroy
  
end
