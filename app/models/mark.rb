class Mark < ActiveRecord::Base
  belongs_to :assessment
  belongs_to :assessable_item, :polymorphic => true
  
end
