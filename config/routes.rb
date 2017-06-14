Rails.application.routes.draw do
  resources :users
  post '/login', to: 'users#login', as: 'login'
  resources :houses
  get '/hda', to: 'houses#hda', as: 'hda'
  resources :devices
  resources :captures
  post '/gen', to: 'generator#generate', as: 'gen'
end
