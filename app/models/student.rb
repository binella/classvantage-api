class Student < ActiveRecord::Base
  has_and_belongs_to_many :pages
  
  default_scope order('last_name ASC')
  scope :from_page, lambda { |value| joins(:pages).where(:pages => {:id => (value.is_a?(Page) ? value.id : value) }) }
  
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
    end
  end
end
