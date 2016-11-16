Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  get 'welcome/home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'customers#index'
  resources :customers
  resources :complaints

  resources :bill_books do
    collection { post :import }
  end

  resources :renewals

  resources :plans do
    collection { post :import }
  end
 
  resources :payment_details do
    collection { post :import }
  end
  
  resources :users

  resources :zones

  resources :customers  do
     collection { post :import }
     member do
        get 'activate'
        put 'active'
        get 'complaint_list'
        get 'payment_detail'
        get 'myrenewal'
     end
  end

  get 'active_customers', to: "customers#active_customers"
  get 'inactive_customers', to: "customers#inactive_customers"
  get 'search_active_customers', to: "customers#search_active_customer"
  get 'search_inactive_customers', to: "customers#search_inactive_customer"
  get 'search_customers', to: "customers#search"
  get 'search_complaints', to: "customers#search_complaint"
  
  get 'customer_activate/:id', to: "customers#activate"
  get 'search_employees', to: "employee_details#search"
  put 'active', to: "customers/active"
  get 'customer_complaint_list/:id', to: "customers#complaint_list"
  get 'customer_payment_detail/:id', to: "customers#payment_detail"
  get 'myrenewal/:id', to: "customers#myrenewal"


  resources :complaints  do
     member do
        get 'resolve'
        get 'create_custom'
        put 'success'
     end
  end
  
  get 'open_complaint', to: "complaints#open_complaint"
  get 'close_complaint', to: "complaints#close_complaint"
  get 'resolve/:id',   to: "complaints#resolve"
  put 'complaint_succcess', to: "complaints#success"
  get 'newcomplaint', to: "complaints#assign_complaint"
  get 'create/:id',   to: "complaints#create_custom"


  resources :renewals do
    member do
        get 'renew'
     end
  end
  get 'renew/:id',   to: "renewals#renew"
  post 'new_renewal', to: "renewals#new_renewal"
  
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
