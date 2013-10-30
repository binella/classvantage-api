class Mark < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :row
  
end
