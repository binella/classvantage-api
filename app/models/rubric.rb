class Rubric < ActiveRecord::Base
  belongs_to :unit
  #has_and_belongs_to_many :pages # WERE NOT DOING THIS RIGHT NOW (BUT JOIN TABLE EXISTS)
  belongs_to :page
  has_many :rows
end
