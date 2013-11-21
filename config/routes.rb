Classvantage::Application.routes.draw do
  # CORS
  match '/*path' => 'application#options', :via => :options
  
  use_doorkeeper
  #devise_for :users
  
  match '/register' => 'application#register', :via => :post
  
  namespace :v1, :defaults => { :format => 'json' } do
    resource :me, :controller => :me
    
    resources :rubrics
    resources :assignments
    
    resources :units, :only => [:index, :show, :update]
    
    resources :overall_expectations, :only => [:create, :update]
    resources :specific_expectations, :only => [:create, :update]
    resources :rows, :only => [:create, :update]
    
    # Default gradebook
    resource :gradebook, :controller => :gradebooks
    
    resources :assessments, :only => [:create, :update, :show]
    resources :marks, :only => [:create, :update, :show]
    
    resources :pages
    
    resources :students
    
    #resources :gradebooks do
      #resources :pages
    #end
    
  end
end
