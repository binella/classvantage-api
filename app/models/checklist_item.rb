class ChecklistItem < ActiveRecord::Base
  belongs_to :checklist
  has_many :marks, :as => :assessable_item, :dependent => :destroy
end
