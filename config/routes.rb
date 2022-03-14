Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  root to: 'apartments#index'
  resources :apartments do 
    resources :tenants, shallow: true 
    resources :leases, shallow: true 
  end 


end
