# -*- encoding : utf-8 -*-
Tmca::Application.routes.draw do
  match '/search', :to => 'search#index', :as => 'search', :via => :get
  match '/information', :to => 'informations#index', :as => 'information', :via => :get
  
  namespace :admin do
    
    match '/', :to => 'sessions#new', :as => 'login', :via => :get    
    match '/logout', :to => 'sessions#destroy', :as => 'logout', :via => :get
    match 'install', :to => 'installs#new', :via => :get
    resources :sessions
    resources :exhibitions do
      member do
        put 'set_current'
        put 'set_upcoming'
      end
    end
    
    resources :news
    resources :educations do
      member do
        put 'set_current'
        put 'set_upcoming'
      end
    end
    resources :installs
    resources :events do
      member do
        put 'set_current'
        put 'set_upcoming'
      end
    end
    resources :informations
    resources :mailinglists
    resources :mailingtemplates
    
    resources :pictures do
      collection do
        delete 'delete_files'
      end
    end
    
    resources :pdfs do
      collection do
        delete 'delete_files'
      end
    end
    
  end
  
  resources :events
  resources :exhibitions
  resources :news
  resources :educations
  resources :mailinglists
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  
  root :to => "welcomes#index"
end
