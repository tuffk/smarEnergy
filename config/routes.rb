Rails.application.routes.draw do
  resources :users
  post '/login', to: 'users#login', as: 'login'
  resources :homes
  resources :devices
  resources :captures
end
