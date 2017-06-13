Rails.application.routes.draw do
  resources :users
  resources :homes
  resources :devices
  resources :captures
end
