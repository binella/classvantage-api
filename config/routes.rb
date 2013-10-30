Classvantage::Application.routes.draw do
  # CORS
  match '/*path' => 'application#options', :via => :options
  
  use_doorkeeper
  devise_for :users
  
  
  
  namespace :v1, :defaults => { :format => 'json' } do
    resource :me, :controller => :me
    
    resources :rubrics
    
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
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
