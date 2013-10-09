class Student < ActiveRecord::Base
  has_and_belongs_to_many :pages
  
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
