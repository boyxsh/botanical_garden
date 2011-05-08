BotanicalGarden::Application.routes.draw do

  resources :products

  resources :categories

  resources :appreciations

  get "home/index"

  devise_for :users

  get "/order/:id" => "home#order"
  get "/popular(.:format)" => "home#popular"
  get "/product(.:format)" => "home#product"
  get "/add_item/:id" => "products#add_item"
  get "/save_order/:id" => "products#save_order"
  get "/update_item_quantity/:id/:quantity" => "home#update_item_quantity"
  get "/remove_item/:id" => "home#remove_item"
  
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

  resources :forums do
    resources :topics do
      resources :posts
    end
  end

  #resources :forums do
    #resources :topics 
  #end

    #resources :topics do
      #resources :posts
    #end

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
   root :to => "home#index"
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
