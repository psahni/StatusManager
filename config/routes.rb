StatusManager::Application.routes.draw do

  root 'home#index'


  devise_for :members
  devise_scope :member do
    match '/members/confirmation/edit', to: 'devise/confirmations#edit', via: :get, as: :edit_member_confirmation
    match '/members/confirmation', to: 'devise/confirmations#update', via: [:patch, :put], as: :update_member_confirmation
    match '/login', to: 'devise/sessions#new', via: :get
    match '/signup', to: 'devise/registrations#new', via: :get
  end


  resources :team_members do
    member do
      get :getStatus
    end
  end

  resources :settings  
  mount RailsAdmin::Engine => '/smadmin', as: 'rails_admin'

  # pass oid as param
  resources :status, param: :oid do
    collection do
      get :track_status
    end
  end

  match '/time' => 'home#time', :via => [:get, :post]
  match '/dashboard' => 'home#dashboard', :via => [:get], as: :dashboard
  match '/status/:oid/show' => 'status#show', :via => [:get, :post], as: :status_show
  get 'export_xls', :to => 'home#export_xls'
  get '/email' => 'home#inline_email'
  post '/submit_email/:token' => 'home#inline_email_submit', as: :submit_email
  match 'jobs' => 'home#job_test', via: :get
  match 'getStatus' => 'team_members#getStatus', via: :get
  
end
