StatusManager::Application.routes.draw do
  
  root 'home#index'
  get 'export_xls', :to => 'home#export_xls'

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable
  
end
