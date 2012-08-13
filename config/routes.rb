EotFreelance::Application.routes.draw do  
  resources :services

  resources :projects

  devise_scope :camrade do
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
    get 'register', to: 'devise/registrations#new', as: :register
  end
  
  devise_for :camrades
  
  resources :camrades do
    resource :resume
  end
  resources :companies, only: [:index]
  match 'specializations/(:scope_id)' => 'specializations#index', as: :specializations
  
  root to: 'welcome#index'
end
