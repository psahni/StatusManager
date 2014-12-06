StatusManager::Application.routes.draw do

  root 'home#index'

  devise_for :members
  devise_scope :member do
    match '/members/confirmation/edit', to: 'devise/confirmations#edit', via: :get, as: :edit_member_confirmation
    match '/members/confirmation', to: 'devise/confirmations#update', via: [:patch, :put], as: :update_member_confirmation
    match '/login', to: 'devise/sessions#new', via: :get
    match '/signup', to: 'devise/registrations#new', via: :get
  end


  mount RailsAdmin::Engine => '/smadmin', as: 'rails_admin'

  resources :status, param: :oid

  match '/time' => 'home#time', :via => [:get, :post]
  match '/dashboard' => 'home#dashboard', :via => [:get], as: :dashboard
  match '/status/:oid/show' => 'status#show', :via => [:get, :post], as: :status_show
  get 'export_xls', :to => 'home#export_xls'
  get '/email' => 'home#inline_email'
  post '/submit_email/:token' => 'home#inline_email_submit', as: :submit_email

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
  
end
