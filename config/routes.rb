MentorMentored::Application.routes.draw do
  get "profile/create"
  get "profile/profile"
  get "search/new"
  get "search/create"
 # get "settings/create"
 # get "settings/destroy"
  get "settings/new"
  get "educations/create"
  get "educations/destroy"
  #get "educations/new"
  get "professions/create"
  get "professions/destroy"
  #get "professions/new"
  get "communications/create"
  get "communications/destroy"
  get "availabilities/create"
  get "availabilities/destroy"
  #get "availability/new"
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :availabilities, only: [:create, :destroy]
  resources :communications, only: [:create, :destroy]
  resources :professions, only: [:create, :destroy]
  resources :educations, only: [:create, :destroy]
  resources :settings, only: [:new, :create]
  #resources :search, only: [:search, :create]

  root "static_pages#home"
  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new',via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'
  match '/default', to: 'static_pages#default', via: 'get'  
  match '/availabilities', to: 'availabilities#new', via: 'get'
  match '/communications', to: 'communications#new', via: 'get'
  match '/professions', to: 'professions#new', via: 'get'
  match '/educations', to: 'educations#new', via: 'get'
  match '/settings', to: 'settings#new', via: "get"
  #match '/search',  to: 'static_pages#search',    via: 'get'
  match '/searching',  to: 'search#search', via: 'get'
  match '/searching',  to: 'search#search', via: 'post'
  match '/searchings', to: 'search#create', via: 'get'
  match '/profile', to: 'profile#profile', via: 'get'
  match '/pendingrequest', to: 'static_pages#pending_request', via: 'get'
  #match '/pendingrequest', to: 'static_pages#pending_request', via: 'post'
  match '/accepts', to: 'static_pages#creates', via: 'post'
  match '/ignore', to: 'static_pages#update', via: 'post'
  #match '/static_pages', to: 'static_pages#create', via: :post, as: '/accept'
  match '/sentrequest', to: 'static_pages#request_I_have_sent', via: 'get'
  match '/connection', to: 'static_pages#connections', via: 'get'
  match '/setting', to: 'settings#reset_password', :via => :post
  match '/deleteaccount', to: 'settings#delete_my_account', :via => :post
  #match 'profile/:id',to: 'profile#profile',via: 'get'
  #match '/setting', to: 'setting#create', via: "get"
  #get 'settings', :to => redirect('/settings#new')
  #post 'settings', :to => redirect('/settings#new')
  #match '/availabilities/new', to: 'availability#new', via: 'post'
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
