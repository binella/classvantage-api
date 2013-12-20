class ChecklistItem < ActiveRecord::Base
  belongs_to :checklist
  #has_many :marks, :dependent => :destroy
end
