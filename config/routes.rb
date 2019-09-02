Rails.application.routes.draw do
  resources :users
  resources :attendances

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'current-user', to: 'users#fetch_current_user'
end
