class OverallExpectation < ActiveRecord::Base
  belongs_to :unit
  has_many :specific_expectations
  #has_and_belongs_to_many :rubrics
end
