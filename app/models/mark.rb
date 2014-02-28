class Mark < ActiveRecord::Base
  belongs_to :assessment, :touch => true
  belongs_to :assessable_item, :polymorphic => true
  
end
