Classvantage::Application.routes.draw do
  # CORS
  match '/*path' => 'application#options', :via => :options
  
  use_doorkeeper
  devise_for :users
  
  match '/register' => 'application#register', :via => :post
  match '/reset_password' => 'application#reset_password', :via => :post
  
  namespace :v1, :defaults => { :format => 'json' } do
    resource :me, :controller => :me
    
    resources :rubrics
    resources :assignments
    resources :checklists

    # TODO: move these to the admin namespace, :except => {:units => :index/:show?}
    resources :units
    resources :overall_expectations, :only => [:create, :update]
    resources :specific_expectations, :only => [:create, :update]

    resources :rows, :only => [:create, :update]
    resources :checklist_items, :only => [:create, :update]
    
    # Default gradebook
    resource :gradebook, :controller => :gradebooks
    
    resources :assessments, :only => [:create, :update, :show]
    resources :marks, :only => [:create, :update, :show]
    
    resources :pages
    
    resources :students
    
    resources :curriculums, :only => [:index, :show]
    resources :subjects
    resources :strands

    
    #resources :gradebooks do
      #resources :pages
    #end
    
  end
end
