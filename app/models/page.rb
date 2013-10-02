class Page < ActiveRecord::Base
  belongs_to :gradebook
  belongs_to :subject
  has_and_belongs_to_many :students
end
