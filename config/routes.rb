Blacklist::Application.routes.draw do

  resources :coupons, :businesses, :comments, :users, :blogs, :articles, :bookmarks, :categories, :users, :user_sessions
  
  root :to => "home#index", :as => :homepage
  
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  match '/businesses/:catid/:title.html' => 'businesses#index', :as => :businesses_by_cat
  
    # *********   Manager Section   *********
  match '/manager/businesses' => 'manager#businesses_index', :as => :businesses_manager
  match '/manager/:id/update_businesses' => 'manager#businesses_update', :as => :manager_update_businesses
  match '/manager/create_businesses' => 'manager#businesses_create', :as => :manager_create_businesses
  match '/manager/:id/edit_businesses' => 'manager#businesses_edit', :as => :manager_edit_businesses
  match '/manager/new_businesses' => 'manager#businesses_new', :as => :manager_new_businesses
  match '/manager/:id/destroy_businesses' => 'manager#businesses_destroy', :as => :manager_destroy_businesses
  match '/manager/business_sub_cats' => 'manager#business_sub_cats', :as => :business_sub_cats
  
  match '/manager/articles' => 'manager#article_index', :as => :articles_manager
  match '/manager/:id/update_articles' => 'manager#article_update', :as => :manager_update_articles
  match '/manager/create_articles' => 'manager#article_create', :as => :manager_create_articles
  match '/manager/:id/edit_articles' => 'manager#article_edit', :as => :manager_edit_articles
  match '/manager/new_articles' => 'manager#article_new', :as => :manager_new_articles
  match '/manager/:id/destroy_articles' => 'manager#article_destroy', :as => :manager_destroy_articles

  match '/manager/categories' => 'manager#categories_index', :as => :categories_manager
  match '/manager/:id/update_categories' => 'manager#categories_update', :as => :manager_update_categories
  match '/manager/create_categories' => 'manager#categories_create', :as => :manager_create_categories
  match '/manager/:id/edit_categories' => 'manager#categories_edit', :as => :manager_edit_categories
  match '/manager/new_categories' => 'manager#categories_new', :as => :manager_new_categories
  match '/manager/:id/destroy_categories' => 'manager#categories_destroy', :as => :manager_destroy_categories
  
  match '/manager/users' => 'manager#user_index', :as => :users_manager
  match '/manager/:id/update_users' => 'manager#user_update', :as => :manager_update_users
  match '/manager/create_users' => 'manager#user_create', :as => :manager_create_users
  match '/manager/:id/edit_users' => 'manager#user_edit', :as => :manager_edit_users
  match '/manager/new_users' => 'manager#user_new', :as => :manager_new_users
  match '/manager/:id/destroy_users' => 'manager#user_destroy', :as => :manager_destroy_users
  
  match '/manager/coupons' => 'manager#coupons_index', :as => :coupons_manager
  match '/manager/:id/update_coupons' => 'manager#coupons_update', :as => :manager_update_coupons
  match '/manager/create_coupons' => 'manager#coupons_create', :as => :manager_create_coupons
  match '/manager/:id/edit_coupons' => 'manager#coupons_edit', :as => :manager_edit_coupons
  match '/manager/:id/new_coupons' => 'manager#coupons_new', :as => :manager_new_coupons
  match '/manager/:id/destroy_coupons' => 'manager#coupons_destroy', :as => :manager_destroy_coupons
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
