Rails.application.routes.draw do
  resources :users do
    resources :attendances
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
