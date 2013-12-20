class Checklist < ActiveRecord::Base
  belongs_to :unit
  belongs_to :page
  has_many :checklist_items, :dependent => :destroy
  has_many :assessments, :as => :assessable, :dependent => :destroy
  has_and_belongs_to_many :overall_expectations

  scope :with_items, includes(:checklist_items)


  after_update :wipe_overall_expectations
  
  def custom_expectation_enabled=(new_val)
    if custom_expectation and custom_expectation != ''
      write_attribute :custom_expectation_enabled, new_val
    else
      write_attribute :custom_expectation_enabled, false
    end
  end
  

  def wipe_overall_expectations
    #Rails.logger.info "CHANGES ----> #{unit_id_changed?}"
    self.overall_expectation_ids = nil if unit_id_changed?
  end
  
end
