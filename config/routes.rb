WeddingRsvp::Application.routes.draw do

#  resources :foos

  namespace :admin do
    root :to => "session#index"
    match "login" => "session#login", :as => :login
    match "logout" => "session#logout", :as => :logout
    resources :families
    resources :meals

    match 'attendees' => 'attendees#index'
    get 'attendees/ceremony' => 'attendees#ceremony'
    get 'attendees/reception' => 'attendees#reception'
    get 'attendees/meals' => 'attendees#meals'
    get 'attendees/notattending' => 'attendees#notattending'
end

  root :to => "rsvp#index"
  match 'disclaimer' => 'rsvp#disclaimer'
  match 'details' => 'rsvp#details'
  match 'confirm' => 'rsvp#confirm'
  match 'finished' => 'rsvp#finished'

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
end
