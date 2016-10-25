Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  # get 'welcome/home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'customers#index'
  resources :customers
  resources :complaints
  resources :bill_books
  resources :renewals
  resources :plans

  resources :zones
  resources :customers  do
     member do
        get 'activate'
        put 'active'
        get 'complaint_list'
        get 'payment_detail'
        get 'myrenewal'
     end
  end
  get 'search_customers', to: "customers#search"
  get 'customer_activate/:id', to: "customers#activate"
  get 'search_employees', to: "employee_details#search"

  put 'active', to: "customers/active"
  get 'customer_complaint_list/:id', to: "customers#complaint_list"
  get 'customer_payment_detail/:id', to: "customers#payment_detail"
  get 'myrenewal/:id', to: "customers#myrenewal"
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
