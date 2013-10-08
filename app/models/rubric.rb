class Rubric < ActiveRecord::Base
  belongs_to :unit
  has_and_belongs_to_many :pages
  #belongs_to :page
end
