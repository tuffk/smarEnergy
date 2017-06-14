Rails.application.routes.draw do
  resources :users
  post '/login', to: 'users#login', as: 'login'
  resources :houses
  resources :devices
  resources :captures
end
