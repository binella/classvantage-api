class OverallExpectation < ActiveRecord::Base
  belongs_to :unit
  has_many :specific_expectations
end
