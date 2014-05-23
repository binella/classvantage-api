class Student < ActiveRecord::Base
  has_and_belongs_to_many :pages
  has_many :assessments
  has_many :parent_emails
  belongs_to :creator, :class_name => 'User'
  
  after_create :persist_parent_emails
  
  #accepts_nested_attributes_for :parent_emails, :allow_destroy => true
  
  #default_scope order('last_name ASC')
  scope :from_page, lambda { |value| joins(:pages).where(:pages => {:id => (value.is_a?(Page) ? value.id : value) }) }
  scope :with_assessments, -> { includes(:assessments) }
  
  scope :in_workspace, lambda { |user|  joins("INNER JOIN pages_students ON pages_students.student_id = students.id")
    .where('pages_students.page_id' => Page.where(:gradebook_id => Gradebook.where(:user_id => user.id))) }
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def full_name=(new_name)
    match = /^(.*)\s(\S*)$/.match(new_name)
    if match
      self.first_name = match[1]
      self.last_name = match[2] 
    else
      self.last_name = new_name
      self.first_name = nil
    end
  end
  
  def parent_emails=(new_array)
    if self.id
      ParentEmail.destroy_all :student_id => self.id
      return if not new_array
      new_array.each do |email_address|
        self.parent_emails.create :email_address => email_address
      end
    else
      @unpersisted_parent_emails = new_array
    end
  end
  
  private
  
  def persist_parent_emails
    self.parent_emails = @unpersisted_parent_emails
  end
  
end
