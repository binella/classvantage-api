class Assignment < ActiveRecord::Base
  belongs_to :page, :touch => true
  has_many :assessments, :as => :assessable, :dependent => :destroy
  
end
