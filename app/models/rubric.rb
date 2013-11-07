class Rubric < ActiveRecord::Base
  belongs_to :unit
  #has_and_belongs_to_many :pages # WERE NOT DOING THIS RIGHT NOW (BUT JOIN TABLE EXISTS)
  belongs_to :page
  has_many :rows, :dependent => :destroy
  has_many :assessments
  has_and_belongs_to_many :overall_expectations

  scope :with_rows, includes(:rows)
  
  def custom_expectation_enabled=(new_val)
    Rails.logger.info "HELLLLLLLLOOO:    #{custom_expectation}"
    if custom_expectation and custom_expectation != ''
      write_attribute :custom_expectation_enabled, new_val
    else
      write_attribute :custom_expectation_enabled, false
    end
  end
  
end
