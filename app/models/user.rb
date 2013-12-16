class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :gradebooks
  
  validates_presence_of :province, :name, :school
  
  after_create :create_gradebook

  
  def required_fields
    [:name, :school, :province]
  end
  
  def create_gradebook
    self.gradebooks.create
  end
    
  def default_gradebook
    gradebooks.first
  end
  
end
