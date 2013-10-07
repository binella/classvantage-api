User.class_eval do
  after_create :create_gradebook
  
  def create_gradebook
    self.gradebooks.create
  end
  
end